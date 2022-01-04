package server

import (
	"goblog/config"
	"goblog/dao"
	"goblog/model"
	"goblog/util"
)

/* var JoinDAO *gorm.DB

func init() {
	db := dao.MDB.Table("views").Select("views.id,views.title,views.click,views.created_at,views.pic,views.typeid,views.content, tps.name as Typename")
	JoinDAO = db.Joins("left join tps on tps.id = views.typeid")
} */

//获取列表,恶心死了gorm- 字段无法进入join关联查询结果...调了我半天.
func GetViewlist(id interface{}, page int, limit int) (vi []model.ViewJson) {
	db := dao.MDB.Table("views").Select("views.id,views.scenes,views.title,views.click,views.created_at,updated_at,views.pic,views.typeid,views.content, tps.name as Typename")
	JoinDAO := db.Joins("left join tps on tps.id = views.typeid").Where("views.status = 1")
	if limit == 0 {
		limit = 10 //一页默认10条
	}
	if page < 1 {
		page = 1
	}
	page -= 1 //过滤掉的页面要减 1
	order := "created_at desc"
	switch id {
	case "0":
		JoinDAO.Limit(limit).Offset(page * limit).Order(order).Find(&vi)
	case "-1":
		JoinDAO.Where("tuijian = ?", 1).Limit(limit).Order(order).Find(&vi)
	case "-2":
		JoinDAO.Where("swiper = ?", 1).Limit(limit / 2).Order(order).Find(&vi)
	case "-33":
		db.Limit(limit).Offset(page * limit).Order(order).Find(&vi)
	case "-3":
		JoinDAO.Limit(limit).Offset(page * limit).Order("click desc").Find(&vi)
	case "-4":
		JoinDAO.Where("tuijian = ?", 1).Limit(limit).Order("updated_at desc").Find(&vi)
	case "-44":
		JoinDAO.Limit(limit).Offset(page * limit).Order("updated_at desc").Find(&vi)
	case "-5":
		JoinDAO.Where("tuijian = ?", 1).Limit(limit).Order(order).Find(&vi)
	default:

		JoinDAO.Where("typeid = ?", id).Limit(limit).Offset(page * limit).Order(order).Find(&vi)
		//fmt.Printf("123%+v", &vi)
	}
	return
}

//获取当前分类下面的10条文章
func Findlist2(id string) (vi []model.ViewJson) {
	db := dao.MDB.Table("views").Select("views.id,views.title,views.click,views.created_at,views.pic,views.typeid,views.content, tps.name as Typename")
	JoinDAO := db.Joins("left join tps on tps.id = views.typeid").Where("views.status = 1")
	if id != "0" {
		JoinDAO = JoinDAO.Where("typeid = ?", id)
	}
	JoinDAO.Limit(10).Order("created_at desc").Find(&vi)
	return
}

//获取当前分类下面的10条文章
func Findlist3(id string) (vi []model.ViewJson) {
	db := dao.MDB.Table("views").Select("views.id,views.title,views.click,views.created_at,views.pic,views.typeid,views.content, tps.name as Typename")
	JoinDAO := db.Joins("left join tps on tps.id = views.typeid").Where("views.status = 1")
	if id != "0" {
		JoinDAO = JoinDAO.Where("typeid = ?", id)
	}
	JoinDAO.Limit(10).Order("created_at desc").Find(&vi)
	return
}

//获取搜索到的信息
func SearchView(views *model.ListInfo) (err error) {
	db := dao.MDB.Table("views").Select("views.id,views.title,views.click,views.created_at,views.pic,views.typeid,views.content, tps.name as Typename")
	JoinDAO := db.Joins("left join tps on tps.id = views.typeid").Where("views.status = 1")
	util.Ini(&views.Page)
	//fmt.Printf("pageinfo=%+v", *views)
	//开始处理一下page信息
	err = JoinDAO.Where("title LIKE ?", "%"+views.Page.Keyword+"%").Limit(views.Page.Num).Order("created_at desc").Find(&views.Views).Count(&views.Page.Sum).Error
	return
}

//获取列表新的
func GetListV(views *model.ListInfo) (err error) {
	pa := views.Page
	if pa.Page == 0 {
		pa.Page = 1
	}
	if pa.Num == 0 {
		pa.Num = 10
	}
	err = util.GetListCache(views)
	if err == nil {
		return
	}
	//fmt.Printf("info%+v", views)
	JoinDAO := dao.MDB.Table("views").Select("views.id,views.title,views.click,views.created_at,views.pic,views.typeid,views.content, tps.name as Typename").Joins("left join tps on tps.id = views.typeid")
	//util.Ini(&pa)
	db := JoinDAO.Where("views.status = 1")
	if pa.ID != 0 {
		db = db.Where("typeid = ?", pa.ID)
		dao.MDB.Where("id = ?", pa.ID).First(&views.Listinfo)
		//fmt.Printf("分类信息是%+v", &views.Listinfo)
	}
	if pa.Keyword != "" {
		db = db.Where("title LIKE ?", "%"+pa.Keyword+"%")
	}
	db = db.Limit(pa.Num).Offset((pa.Page - 1) * pa.Num).Order("created_at desc")
	err = db.Find(&views.Views).Count(&pa.Sum).Error
	views.Page.Sum = pa.Sum
	util.PagesinfoTo(views)  //处理一下页面分类信息
	util.SetListCache(views) //设置进缓存
	return
}

//获取最新,推荐,tdk
func Getinfo() (baseinfo model.BaseInfo, err error) {
	err = util.GetCache(util.BaseCache, &baseinfo)
	if err != nil {
		//fmt.Println("没有缓存")
		// baseinfo.New = util.Imgsrc(GetViewlist("-5", 1))      //最新
		// baseinfo.Tuijian = util.Imgsrc(GetViewlist("-4", 1)) //推荐
		// baseinfo.Tuijian = util.Imgsrc(GetViewlist("-5", 1)) //推荐
		baseinfo.Tdk = config.GetTDK()
		err = dao.MDB.Where("status = ?", "1").Find(&baseinfo.Typeinfo).Error //获取全部分类信息
		util.SetCache(util.BaseCache, &baseinfo)
	}
	return
}
