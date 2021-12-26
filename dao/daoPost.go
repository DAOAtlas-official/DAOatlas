package dao

import (
	"goblog/model"
	"strings"
	"sync"
)

// GetDaoAttr 获取 dao post
func GetDaoAttr(pid int64) (daoAttr model.DaoPost, err error) {
	err = MDB.Where("pid = ?", pid).Find(&daoAttr).Error
	return
}

type DaoPostItem struct {
	model.View
	model.DaoPost
}

// GetDaoPostList 获取dao post 数据列表
// where {"status = ? ": 1}
func GetDaoPostList(page int, limit int, where map[string]interface{}, order string) (daoList []DaoPostItem, err error) {
	db := MDB.Table("views").Select("views.id,views.scenes,views.title,views.click,views.created_at,views.pic,views.typeid,views.content,dp.members")
	JoinDao := db.Joins("LEFT JOIN dao_post AS dp ON dp.pid = views.id").Where("views.scenes = ?", model.DAO_POST)
	JoinDao = JoinDao.Limit(limit).Offset(page * limit)
	if where != nil {
		for k, v := range where {
			JoinDao = JoinDao.Where(k, v)
		}
	}
	if order != "" {
		JoinDao = JoinDao.Order(order)
	}
	JoinDao.Find(&daoList)
	return
}

// GetDaoPostDetail 获取dao post 详情
func GetDaoPostDetail(id int64) (post model.View, daoAttr model.DaoPost, err error) {
	var wg sync.WaitGroup
	wg.Add(2)
	go func() {
		err = MDB.Where("id = ?", id).Find(&post).Error
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
		err = MDB.Where("cate = ?", cate).Limit(limit).Find(&tags).Error
	} else {
		err = MDB.Limit(limit).Find(&tags).Error
	}
	return
}

// LinkPostTag 关联post tag
func LinkPostTag(pid int64, tags []model.PostTag) error {
	arguments := make([]string, len(tags))
	params := make([]interface{}, len(tags)*2)
	for j, tag := range tags {
		arguments[j] = "(?,?)"
		i := j * 2
		params[i] = tag.Pid
		params[i+1] = tag.Tid
	}
	err := MDB.Exec(`INSERT post_tag(pid, tid) values `+strings.Join(arguments, ","), params...).Error
	return err
}

func UnLinkPostTag(pid int64) error {
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
