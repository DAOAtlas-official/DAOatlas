package dao

import (
	"goblog/model"
	"strings"
	"sync"

	"gorm.io/gorm"
)

// GetDaoAttr 获取 DAO post
func GetDaoAttr(pid int64) (daoAttr model.DaoPost, err error) {
	err = MDB.Where("pid = ?", pid).Find(&daoAttr).Error
	return
}

type DaoPostItem struct {
	model.View
	model.DaoPost
}

// GetDaoPostList 获取DAO post 数据列表
// where {"status = ? ": 1}
func GetDaoPostList(page int, limit int, where map[string]interface{}, order string) (daoList []DaoPostItem, err error) {
	db := MDB.Table("views").Select("views.id,views.scenes,views.title,views.click,views.created_at,views.pic,views.typeid,views.content,dp.members,dp.summary")
	JoinDAO := db.Joins("LEFT JOIN dao_post AS dp ON dp.pid = views.id").Where("views.scenes = ?", model.DAO_POST).Order("updated_at desc")
	// JoinDAO = JoinDAO.Limit(limit).Offset(page * limit)
	JoinDAO = JoinDAO.Limit(limit)
	if where != nil {
		for k, v := range where {
			JoinDAO = JoinDAO.Where(k, v)
		}
	}
	if order != "" {
		JoinDAO = JoinDAO.Order(order)
	}
	JoinDAO.Find(&daoList)
	return
}

// GetDaoPostDetail 获取DAO post 详情
func GetDaoPostDetail(id int64) (post model.View, post_tag model.PostTag, daoAttr model.DaoPost, err error) {
	var wg sync.WaitGroup
	wg.Add(3)
	go func() {
		err = MDB.Where("id = ?", id).Find(&post).Error
		wg.Done()
	}()

	// jason add to get dao detail tags by view_id
	go func() {
		err = MDB.Where("pid = ?", post.ID).Find(&post_tag).Error
		wg.Done()
	}()

	go func() {
		err = MDB.Where("pid = ?", id).Find(&daoAttr).Error
		wg.Done()
	}()
	wg.Wait()
	return
}

// GetTags 获取tag
func GetTags(cate uint8, limit int) (tags []model.Tag, err error) {
	if cate != 0 {
		err = MDB.Where("cate = ?", cate).Limit(limit).Order("id desc").Find(&tags).Error
	} else {
		err = MDB.Limit(limit).Find(&tags).Order("id desc").Error
	}
	return
}

// LinkPostTag 关联post tag
func LinkPostTag(pid int64, tags []model.PostTag) error {
	arguments := make([]string, len(tags))
	params := make([]interface{}, len(tags)*2)
	tids := make([]int64, 0)
	for j, tag := range tags {
		arguments[j] = "(?,?)"
		i := j * 2
		params[i] = tag.Pid
		params[i+1] = tag.Tid
		tids = append(tids, tag.Tid)
	}
	MDB.Model(&model.Tag{}).Where(tids).UpdateColumn("use_count", gorm.Expr("use_count + ?", 1)) // tag使用量
	err := MDB.Exec(`INSERT post_tag(pid, tid) values `+strings.Join(arguments, ","), params...).Error
	return err
}

// 根据文章id获取标签
func GetPostTagsByPid(pid int64) (tags []model.PostTag, err error) {
	err = MDB.Where("pid = ?", pid).Find(&tags).Error
	return
}

func UnLinkPostTag(pid int64) error {
	// 获取之前的标签
	tags, err := GetPostTagsByPid(pid)
	if err == nil && len(tags) > 0 {
		tids := make([]int64, 0, len(tags))
		for _, tag := range tags {
			tids = append(tids, tag.Tid)
		}
		// 同步tag使用量
		MDB.Model(&model.Tag{}).Where(tids).UpdateColumn("use_count", gorm.Expr("use_count - ?", 1))
	}

	return MDB.Where("pid = ?", pid).Delete(model.PostTag{}).Error
}

// 根据标签id 获取文章列表
func GetPostsByTagID(tid int64, page int, limit int) (daoList []DaoPostItem, err error) {
	var postTags []model.PostTag
	MDB.Where("tid = ?", tid).Limit(limit).Offset(page * limit).Find(&postTags)
	if len(postTags) > 0 {
		pids := make([]int64, 0, len(postTags))
		for i, _ := range postTags {
			pids = append(pids, postTags[i].Pid)
		}
		where := map[string]interface{}{
			"views.id in (?)": pids,
		}
		daoList, err = GetDaoPostList(page, limit, where, "")
	}
	return
}
