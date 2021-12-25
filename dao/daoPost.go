package dao

import (
	"goblog/model"
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
