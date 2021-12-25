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
