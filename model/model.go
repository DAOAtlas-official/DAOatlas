package model

/*
 * @Description:
 * @Author: longfei
 * @FilePath: \go\model\model.go
 */

import (
	"gorm.io/gorm"
)

const (
	_ = iota
	BASE_POST
	DAO_POST
)

//下面直接转过来不行
type View struct {
	ID        uint           `gorm:"primarykey"  json:"id" form:"id"`
	CreatedAt uint           `gorm:"size:255" json:"createtime" form:"createtime"`
	UpdatedAt uint           `gorm:"size:255" json:"updatetime" form:"updatetime"`
	DeletedAt gorm.DeletedAt `gorm:"index"`
	Typeid    int            `gorm:"size:10"  json:"typeid" form:"typeid"`          //分类的ID，关联
	Title     string         `gorm:"size:255" json:"title" form:"title"`            //标题
	Click     int            `gorm:"size:10" json:"click"`                          //点击量
	Tuijian   int8           `gorm:"size:1" json:"tuijian" form:"tuijian"`          //是否为推荐
	Swiper    int8           `gorm:"size:1" json:"swiper" form:"swiper"`            //是否为轮播图
	Pic       string         `gorm:"size:255" json:"pic" form:"pic"`                //文章的缩略图
	Status    int8           `gorm:"size:1;default:1;" json:"status" form:"status"` //文章状态，0删除，1正常
	Content   string         `gorm:"size:500" json:"content" form:"content"`        //文章的简介
	Body      string         `gorm:"size:5000" json:"body" form:"body"`             //详细的内容
	Ctime     string         `gorm:"-" json:"ctime" form:"ctime"`
	Typename  string         `gorm:"-" json:"typename" form:"typename"`
	Scenes    uint8          `gorm:"scenes" json:"scenes" form:"scenes"` // 1: 普通文章 2: DAO 文章
	Tag       string         `gorm:"tag" json:"tag" form:"tag"`          //  冗余存储Tag 主键`id#标签名` 逗号分割 12#Dao, 34#EOS
}

//评论
type Comment struct {
	ID        uint   `gorm:"primarykey"  json:"id" form:"id"`
	CreatedAt uint   `gorm:"size:255" json:"createtime" form:"createtime"`
	Status    int8   `gorm:"size:1;default:1;" json:"status" form:"status"` //状态，0删除，1正常
	Uid       uint   `gorm:"index"  json:"uid" form:"uid"`                  //发表评论的ID
	Name      string `gorm:"size:24" json:"name" form:"name"`               //发表评论的id
}

type ViewJson struct {
	ID        uint `gorm:"primarykey" json:"id" form:"id"`
	CreatedAt uint
	Typeid    int    ` json:"typeid" form:"typeid"` //分类的ID，关联
	Scenes    uint8  ` json:"scenes" form:"scenes"`
	Title     string ` json:"title" form:"title"`       //标题
	Pic       string ` json:"pic" form:"pic"`           //文章的缩略图
	Status    uint8  ` json:"status"`                   //文章状态，0删除，1正常
	Content   string `json:"content" form:"content"`    //文章的简介
	Typename  string ` json:"typename" form:"typename"` //存储一下分类名称
	Ctime     string ` json:"ctime" form:"ctime"`
	Summary   string `gorm:"column:summary" json:"summary"`
	Members   string `gorm:"column:members" json:"members"`
	Click     int            `gorm:"size:10" json:"click"`                          //点击量
}

//分类表
type Tp struct {
	ID     uint       `gorm:"primarykey" json:"id" form:"id"`
	Name   string     `gorm:"size:255;" form:"name" json:"name"`               //名称
	Level  int        `gorm:"size:10;default:0;" form:"level" json:"level"`    //分类排序
	Info   string     `gorm:"size:255;" form:"info" json:"info"`               //介绍
	Status string     `gorm:"size:1;default:'1';" form:"status" json:"status"` //状态,默认1,0表示删除
	Views  []ViewJson `gorm:"-"`
}

//系统设置
type Config struct {
	ID      uint   `gorm:"primarykey"  json:"id" form:"id"`        //设置ID
	Name    string `gorm:"size:255"  json:"name" form:"name"`      //设置的名称
	Type    string `gorm:"size:10"  json:"type" form:"type"`       //设置所属分类
	Content string `gorm:"size:500" json:"content" form:"content"` //设置的介绍
	Value   string `gorm:"size:500" json:"value" form:"value"`     //系统设置值
	Group   uint   `gorm:"size:6" json:"group" form:"group"`       //所属群组,方便一次调出来
}

//网站的标题关键词等.
type Tdk struct {
	Title       string ` json:"title" form:"title"`
	Keyword     string ` json:"keyword" form:"keyword"`
	Description string ` json:"description" form:"description"`
	Beian       string ` json:"beian" form:"beian"`
	Goan        string ` json:"goan" form:"goan"`         //公安的备案号
	Goanurl     string ` json:"goanurl" form:"goanurl"`   //备案的网址
	Tongjiid    string ` json:"tongjiid" form:"tongjiid"` //百度统计的id
}

//用户表
type User struct {
	Id     int    `gorm:"primary_key" json:"id"  form:"id"`
	Name   string `gorm:"size:255" json:"name"  form:"name"`
	Age    int    `gorm:"size:2" json:"age" form:"age"`
	Gender int    `gorm:"size:2" json:"gender" form:"gender"` //1:男、2:女
	Pwd    string `gorm:"size:255" json:"pwd" form:"pwd"`
}

// 标签表
type Tag struct {
	ID       int    `gorm:"primary_key" json:"id" form:"id"`
	Name     string `gorm:"column:name;" form:"name" json:"name"`               // 名称
	Cate     uint8  `gorm:"column:cate;" form:"cate" json:"cate"`               // 标签所属文章类型
	UseCount int    `gorm:"column:use_count" form:"use_count" json:"use_count"` // 标签使用数
}

func (t Tag) TableName() string {
	return "tag"
}

// DAO 文章扩展表
type DaoPost struct {
	// ID      int64 `gorm:"column:id" json:"id"`
	Pid             int64  `gorm:"pid" json:"pid"` // View 表关联id
	StartTime       string `gorm:"start_time" json:"start_time"`
	Name            string `gorm:"column:name" json:"name"`
	Image           string `gorm:"column:image" json:"image"`
	Members         string `gorm:"column:members" json:"members"`
	KeyContributors string `gorm:"column:key_contributors" json:"key_contributors"`
	TokenName       string `gorm:"column:token_name" json:"token_name"`
	TokenLink       string `gorm:"column:token_link" json:"token_link"`
	TokenHolders    string `gorm:"column:token_holders" json:"token_holders"`
	Treasury        string `gorm:"column:treasury" json:"treasury"`
	AUM             string `gorm:"column:AUM" json:"AUM"`
	Voting          string `gorm:"column:voting" json:"voting"`
	Forum           string `gorm:"column:forum" json:"forum"`
	Website         string `gorm:"column:website" json:"website"`
	Twitter         string `gorm:"column:twitter" json:"twitter"`
	Discord         string `gorm:"column:discord" json:"discord"`
	Wiki            string `gorm:"column:wiki" json:"wiki"`
	Activities      string `gorm:"column:activities" json:"activities"`
	Summary         string `gorm:"column:summary" json:"summary"`
	HowToJoin       string `gorm:"column:how_to_join" json:"how_to_join"`
}

func (d DaoPost) TableName() string {
	return "dao_post"
}

// 文章标签隐射表, 用于标签过滤文章
type PostTag struct {
	ID  int64 `gorm:"column:id" json:"id"`
	Pid int64 `gorm:"column:pid" json:"pid"` // 关联View 表主键
	Tid int64 `gorm:"column:tid" json:"tid"` // 关联Tag 表主键
}

func (d PostTag) TableName() string {
	return "post_tag"
}
