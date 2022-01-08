package dao

import "goblog/model"

func GetArticlesList(page int, limit int, where map[string]interface{}, order string) (articlesList []model.View, err error) {
	db := MDB.Table("views").Select("views.id,views.scenes,views.title,views.click,views.created_at,views.pic,views.typeid,views.content")
	JoinDAO := db.Where("views.scenes = ?", model.BASE_POST).Order("created_at desc")
	JoinDAO = JoinDAO.Limit(limit).Offset(page * limit)
	if where != nil {
		for k, v := range where {
			JoinDAO = JoinDAO.Where(k, v)
		}
	}
	if order != "" {
		JoinDAO = JoinDAO.Order(order)
	}
	JoinDAO.Find(&articlesList)
	return
}
