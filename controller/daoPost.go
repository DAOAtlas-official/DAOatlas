package controller

import (
	"goblog/dao"
	"goblog/model"
	"goblog/server"
	"net/http"
	"strconv"
	"sync"

	"github.com/gin-gonic/gin"
)

func DaosPageList(c *gin.Context) {
	var wg sync.WaitGroup
	var tags []model.Tag // 标签数据
	var daoPosts []dao.DaoPostItem
	page := c.Query("page")
	if page == "" {
		page = "1"
	}
	pageNum, _ := strconv.ParseInt(page, 10, 32)
	pageNum = pageNum - 1
	// 标签
	wg.Add(2)
	go func() {
		tags, _ = dao.GetTags(0, 15)
		wg.Done()
	}()

	go func() {
		where := map[string]interface{}{
			"status = ?": 1,
		}
		daoPosts, _ = dao.GetDaoPostList(int(pageNum), 15, where, "")
		wg.Done()
	}()
	wg.Wait()

	baseinfo, _ := server.Getinfo()

	c.HTML(http.StatusOK, "daosPage.html", gin.H{
		"tab":      "daoPost",
		"page":     pageNum + 2,
		"base":     baseinfo,
		"tags":     tags,
		"daoPosts": daoPosts,
	})
}
