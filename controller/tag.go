package controller

import (
	"fmt"
	"goblog/dao"
	d "goblog/model"
	"log"

	"github.com/gin-gonic/gin"
)

// DelTag 删除标签
func DelTag(c *gin.Context) {
	id := c.Param("id")
	db := dao.MDB //连接数据库模型
	err := db.Where("id = ?", id).Delete(d.Tag{}).Error
	if err != nil {
		fmt.Printf("错误")
	}
	c.JSON(200, gin.H{"msg": "删除成功", "code": 200})
}

func GetTagNew(cate string) (Tag []d.Tag) {
	db := dao.MDB
	if cate != "" {
		db.Where("cate = ?", cate).Find(&Tag)
	} else {
		db.Find(&Tag)
	}
	return
}

// 前端获取标签
func GetTag(c *gin.Context) {
	cate := c.Query("cate")
	tags := GetTagNew(cate)
	c.JSON(200, gin.H{"msg": "ok", "code": 200, "data": tags})
}

// AddTags 添加与更新标签
func AddTag(c *gin.Context) {
	var err error
	var data d.Tag
	if err = c.ShouldBind(&data); err != nil {
		c.JSON(400, gin.H{"msg": "参数错误", "code": 400})
		return
	}
	id := data.ID
	conn := dao.MDB
	log.Println("tag 参数", data)
	if id != 0 {
		err = conn.Model(&d.Tag{}).Where("id = ?", id).Updates(&data).Error
	} else {
		err = conn.Create(&data).Error
	}

	if err != nil {
		fmt.Println("失败")
		c.JSON(400, gin.H{"msg": "失败", "code": 400})
		return
	}
	c.JSON(200, gin.H{"msg": "成功", "code": 200, "data": data})
}
