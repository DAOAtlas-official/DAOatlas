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
	const POPULAR_ID = 43 //默认显示popular标签
	var wg sync.WaitGroup
	var tags []model.Tag // 标签数据
	var daoPosts []dao.DaoPostItem
	page := c.Query("page")
	tagID := c.Query("tid")
	cid := c.Query("cid") // 文章分类id
	limit := 15
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
		if tagID == "" {
			// 分类筛选
			if cid != "" {
				where["views.typeid = ?"] = cid
			} else {
				where["views.typeid = ?"] = POPULAR_ID
			}
			daoPosts, _ = dao.GetDaoPostList(int(pageNum), limit, where, "")
		} else {
			tid, _ := strconv.ParseInt(tagID, 10, 32)
			daoPosts, _ = dao.GetPostsByTagID(tid, int(pageNum), limit)
		}

		wg.Done()
	}()
	wg.Wait()

	baseinfo, _ := server.Getinfo()

	c.HTML(http.StatusOK, "daosPage.html", gin.H{
		"tab":      "daoPost",
		"tid":      tagID,
		"page":     pageNum + 2,
		"base":     baseinfo,
		"tags":     tags,
		"daoPosts": daoPosts,
	})
}
