package controller

/*
 * @Description:
 * @Author: longfei
 * @FilePath: \go\controller\index.go
 */

import (
	"fmt"
	"html/template"
	"net/http"
	"strconv"
	"sync"
	"time"

	"goblog/config"
	"goblog/dao"
	"goblog/model"
	d "goblog/model"
	"goblog/server"
	"goblog/util"

	"github.com/gin-gonic/gin"
)

//这里是详情页
func GetView(c *gin.Context) {
	pid, _ := strconv.Atoi(c.Param("id"))
	post, post_tag, daoAttr, _ := dao.GetDaoPostDetail(int64(pid))
	// vvv := util.GetView(c.Param("id"), 1) //获取文章详情
	if post.ID == 0 {
		Not404(c)
		c.Abort()
		return
	}
	tm := time.Unix(int64(post.CreatedAt), 0)
	post.Ctime = tm.Format("2006-01-02 15:04:05")

	baseinfo, err := server.Getinfo()
	if err != nil {
		server.Fail(c)
		return
	}
	body := template.HTML(post.Body)

	// Todo: 获取 DAO post 详情
	if post.Scenes == model.DAO_POST {
		c.HTML(http.StatusOK, "daoDetail.html", gin.H{
			"view":     post,
			"body":     body,
			"base":     baseinfo,
			"post_tag": post_tag,
			"daoAttr":  daoAttr,
		})
		return
	}
	c.HTML(http.StatusOK, "articlesDetail.html", gin.H{
		"view": post,
		"body": body,
		"base": baseinfo,
	})
}

//获取个人简介信息
func About(c *gin.Context) {
	vvv := util.GetView("148", 2) //个人简介
	if vvv.ID == 0 {
		Not404(c)
		c.Abort()
		return
	}
	tm := time.Unix(int64(vvv.CreatedAt), 0)
	vvv.Ctime = tm.Format("2006-01-02 15:04:05")

	baseinfo, err := server.Getinfo()
	if err != nil {
		server.Fail(c)
		return
	}
	//fmt.Printf("wyth%+v", baseinfo)
	c.HTML(http.StatusOK, "about.html", gin.H{
		"view": vvv,
		"body": template.HTML(vvv.Body),
		"base": baseinfo,
	})
}

// 关联查询测试用 Todo: 静态文件通过nginx反向代理
func Not404(c *gin.Context) {
	tp := GetTypeNew("0") //栏目分类
	c.HTML(http.StatusNotFound, "404.html", gin.H{
		"types": tp,
		"tdk":   config.GetTDK(),
	})
}

//文章搜索服务
/* func Search(c *gin.Context) {
	var searchinfo d.ListInfo
	err := c.ShouldBindQuery(&searchinfo)
	if err != nil {
		server.Fail(c)
		return
	}
	err = server.SearchView(&searchinfo)
	server.ResDataError(searchinfo, err, c)
} */

//新的获取列表功能,搜索页也在这
func NewList(c *gin.Context) {
	var searchinfo d.ListInfo
	err := c.ShouldBindQuery(&searchinfo)
	if err != nil {
		server.Fail(c)
		return
	}
	id1, _ := strconv.Atoi(c.Param("id"))
	if id1 != 0 {
		searchinfo.Page.ID = id1
	}
	fmt.Printf("info%+v %d", searchinfo, id1)
	err = server.GetListV(&searchinfo)
	if err != nil {
		server.Fail(c)
		return
	}
	//fmt.Printf("列表信息是%+v\n", searchinfo)
	baseinfo, err := server.Getinfo()
	if err != nil {
		server.Fail(c)
		return
	}
	//如果没有分类信息,那么是搜索
	if searchinfo.Page.ID == 0 {
		searchinfo.Listinfo.Name = searchinfo.Page.Keyword
		searchinfo.Listinfo.Info = "搜索:" + searchinfo.Page.Keyword + "的搜索结果"
	}
	//fmt.Printf("base基础信息的内容是 %+v \n", baseinfo)
	//server.ResDataError(searchinfo, err, c)
	c.HTML(http.StatusOK, "newlist.html", gin.H{
		"list":     searchinfo, //分类信息,文章列表,当前分类信息
		"baseinfo": baseinfo,   //最新,推荐,tdk,全部分类信息
	})
}

// Index 首页
func Index(c *gin.Context) {
	var wg sync.WaitGroup
	var hotPosts []model.ViewJson
	var newPosts []model.ViewJson
	var recommendPosts []model.ViewJson
	var tags []model.Tag // 标签数据
	// 热门
	wg.Add(4)
	go func() {
		// order by click
		hotPosts = server.GetViewlist("-4", 1, 3)
		wg.Done()
	}()
	// 最新
	go func() {
		newPosts = util.Imgsrc(server.GetViewlist("-33", 1, 3)) //最新
		wg.Done()
	}()
	// 标签
	go func() {
		tags, _ = dao.GetTags(0, 30)
		wg.Done()
	}()

	// 推荐，显示所有dao
	go func() {

		recommendPosts = util.Imgsrc(server.GetViewlist("-44", 1, 15)) //推荐
		// recommendPosts, _ = dao.GetDaoPostList(1, 15, where2, "") //推荐
		wg.Done()
	}()

	wg.Wait()
	baseinfo, _ := server.Getinfo()

	c.HTML(http.StatusOK, "index.html", gin.H{
		"tab":            "home",
		"base":           baseinfo, //基础信息,可替换上面四条
		"tags":           tags,
		"newPosts":       newPosts,
		"hotPosts":       hotPosts,
		"recommendPosts": recommendPosts,
	})
}

func Test(c *gin.Context) {
	util.DelAll()
}
