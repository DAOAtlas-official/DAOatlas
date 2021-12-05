package dao

import "goblog/model"

// GetDaoAttr 获取 dao post
func GetDaoAttr(pid int64) (daoAttr model.DaoPost, err error) {
	err = MDB.Where("pid = ?", pid).Find(&daoAttr).Error
	return
}
