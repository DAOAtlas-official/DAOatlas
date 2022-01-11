package controller

import (
	"net/http"
	"strconv"

	"goblog/dao"
	"goblog/server"

	"github.com/gin-gonic/gin"
)

func articleList(c *gin.Context, tab string, tpl string, page string, where map[string]interface{}) {
	// page := c.Query("page")
	if page == "" {
		page = "1"
	}

	pageNum, _ := strconv.ParseInt(page, 10, 32)
	pageNum = pageNum - 1
	// tpsID := 3 //需要查询Aritcles分类对应id

	list, _ := dao.GetArticlesList(int(pageNum), 15, where, "updated_at desc")
	baseinfo, _ := server.Getinfo()

	c.HTML(http.StatusOK, tpl, gin.H{
		"tab":         tab,
		"page":        pageNum + 2,
		"base":        baseinfo,
		"articleList": list,
	})
}

func Article(c *gin.Context) {
	page := c.Query("page")
	cid := c.Query("cid")
	where := map[string]interface{}{
		"status = ?": 1,
	}
	// 分类筛选
	if cid == "" {
		cid = "(3,4,8)"
	}
	where["views.typeid in (3,4,8) and 1 = ?"] = 1
	articleList(c, "articles", "articlesPage.html", page, where)
	return
}

func Events(c *gin.Context) {
	page := c.Query("page")
	cid := c.Query("cid")
	where := map[string]interface{}{
		"status = ?": 1,
	}
	// 分类筛选
	if cid == "" {
		cid = "6"
	}
	where["views.typeid = ?"] = cid
	articleList(c, "events", "events.html", page, where)
	return
}

func DaoJobs(c *gin.Context) {
	page := c.Query("page")
	cid := c.Query("cid")

	where := map[string]interface{}{
		"status = ?": 1,
	}

	// 分类筛选
	if cid == "" {
		cid = "7"
	}
	where["views.typeid = ?"] = cid
	articleList(c, "jobs", "jobs.html", page, where)
	return
}
