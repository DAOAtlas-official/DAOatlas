package controller

import (
	"net/http"
	"strconv"

	"goblog/dao"
	"goblog/server"

	"github.com/gin-gonic/gin"
)

func articleList(c *gin.Context, tab string, tpl string, page string, where map[string]interface{}, typeID int) {
	// page := c.Query("page")
	if page == "" {
		page = "1"
	}

	pageNum, _ := strconv.ParseInt(page, 10, 32)
	pageNum = pageNum - 1
	// tpsID := 3 //需要查询Aritcles分类对应id

	list, _ := dao.GetArticlesList(int(pageNum), 15, where, "created_at desc", typeID)
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
	where := map[string]interface{}{
		"status = ?": 1,
	}
	articlesTypeID := 8 //写死了先，后面预读到内存，用kv获取
	articleList(c, "articles", "articlesPage.html", page, where, articlesTypeID)
	return
}

func Events(c *gin.Context) {
	page := c.Query("page")

	where := map[string]interface{}{
		"status = ?": 1,
	}
	eventsTypeID := 6 //写死了先，后面预读到内存，用kv获取
	articleList(c, "events", "events.html", page, where, eventsTypeID)
	return
}

func DaoJobs(c *gin.Context) {
	page := c.Query("page")

	where := map[string]interface{}{
		"status = ?": 1,
	}
	DAOJobsTypeID := 7 //写死了先，后面预读到内存，用kv获取
	articleList(c, "jobs", "jobs.html", page, where, DAOJobsTypeID)
	return
}
