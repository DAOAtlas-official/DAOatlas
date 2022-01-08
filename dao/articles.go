package dao

import "goblog/model"

func GetArticlesList(page int, limit int, where map[string]interface{}, order string) (articlesList []model.View, err error) {
	db := MDB.Table("views").Select("views.id,views.scenes,views.title,views.click,views.created_at,views.pic,views.typeid,views.content")
	JoinDao := db.Where("views.scenes = ?", model.BASE_POST)
	JoinDao = JoinDao.Limit(limit).Offset(page * limit)
	if where != nil {
		for k, v := range where {
			JoinDao = JoinDao.Where(k, v)
		}
	}
	if order != "" {
		JoinDao = JoinDao.Order(order)
	}
	JoinDao.Find(&articlesList)
	return
}

func DelArticle(id int64) (err error) {
	tx := MDB.Begin()
	var article model.View
	err = tx.Where("id = ?", id).First(&article).Error
	if err != nil {
		return err
	}
	// 删除扩展表记录
	if article.Scenes == model.DAO_POST {
		err = tx.Where("pid = ?", id).Delete(&model.DaoPost{}).Error
		if err != nil {
			tx.Rollback()
			return err
		}
	}
	// 删除关联标签
	err = tx.Where("pid = ?", id).Delete(&model.PostTag{}).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	// 删除主文章表
	err = tx.Delete(&article).Error
	if err != nil {
		tx.Rollback()
		return err
	}
	return tx.Commit().Error
}
