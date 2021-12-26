package controller

/*
 * @Description:
 * @Author: longfei
 * @FilePath: \go\controller\admin.go
 */
import (
	"fmt"
	"goblog/dao"
	"goblog/model"
	d "goblog/model"
	"goblog/server"
	"goblog/util"
	"net/http"
	"strconv"
	"strings"

	"github.com/gin-gonic/gin"
)

//后台的首页，再在其它页面添加一个文章列表的功能
func AdminIndex(c *gin.Context) {
	c.HTML(http.StatusOK, "admin_index.html", gin.H{}) //进入管理首页
}

//获取当前文章，并且获取分类信息接口
func AdminGetId(c *gin.Context) {
	id := c.Param("id")
	view := util.GetView(id, 0)
	data := map[string]interface{}{
		"post_data": view,
	}
	if view.Scenes == d.DAO_POST {
		daoAttr, _ := dao.GetDaoAttr(int64(view.ID))
		data["dao_attr"] = daoAttr
	}
	tp := GetTypeNew("0")
	c.JSON(200, gin.H{"msg": "获取成功", "code": 200, "data": data, "type": tp})
}

//后台的文章的管理页面
func AdminList(c *gin.Context) {
	pagenum := util.PageNum(c)                   //获取当前第几页
	list := server.GetViewlist("0", pagenum, 20) //列表数据
	i := util.GetTypeCount("0")                  //获取总共的文章数量
	p := util.GetPage(i, pagenum)
	c.HTML(http.StatusOK, "admin_list.html", gin.H{
		"list":     list,
		"page":     pagenum,
		"pageinfo": p,
	})
}

//后台的添加文章详情页,笑死，gin模板语法跟vue.js模板语法冲突，不能直接用，直接加载静态页面吧
func AdminAddView(c *gin.Context) {
	c.HTML(http.StatusOK, "admin_addview.html", gin.H{}) //进入管理首页
}

func formatTags(pid int64, tagStr string) []model.PostTag {
	tags := strings.Split(tagStr, ",")
	// 删除之前的关联
	tagsM := make([]model.PostTag, 0)
	for _, tag := range tags {
		if tag == "" {
			continue
		}
		tagFlag := strings.Split(tag, "#")

		tagID, _ := strconv.ParseInt(tagFlag[0], 10, 32)
		tagsM = append(tagsM, model.PostTag{
			Tid: tagID,
			Pid: pid,
		})
	}
	return tagsM
}

//这里加一个接收前端数据的再返回数据就好啦，应该再加一个是否登陆判断
func AddView(c *gin.Context) {
	var params struct {
		PostData d.View    `json:"post_data"`
		DaoAttr  d.DaoPost `json:"dao_attr"`
	}
	var err error
	c.ShouldBind(&params)

	//typeid没办法直接拿过来，只好再单独获取了
	data := params.PostData
	// typeid := c.PostForm("typeid")
	// t, _ := strconv.Atoi(typeid)
	// data.Typeid = t
	conn := dao.MDB
	msg := "创建成功"
	tx := conn.Begin()
	if data.ID > 0 {
		err = tx.Model(&d.View{}).Where("id = ?", data.ID).Updates(&data).Error
		if data.Scenes == d.DAO_POST {
			err = tx.Model(&d.DaoPost{}).Where("pid = ?", data.ID).Updates(&params.DaoAttr).Error
		}
		if err != nil {
			tx.Rollback()
			c.JSON(200, gin.H{"msg": "更新失败", "code": 200})
			return
		}
		tx.Commit()
		msg = "更新成功"
		if params.PostData.Tag != "" {
			// 删除之前的关联
			tagsM := formatTags(int64(params.PostData.ID), params.PostData.Tag)
			dao.UnLinkPostTag(int64(params.PostData.ID))
			dao.LinkPostTag(int64(params.PostData.ID), tagsM)
		}
		// todo: 标签关联
	} else {
		err = tx.Create(&data).Error
		params.PostData.ID = data.ID
		if data.Scenes == d.DAO_POST {
			daoAttr := params.DaoAttr
			daoAttr.Pid = int64(data.ID)
			err = tx.Create(&daoAttr).Error
		}
		if err != nil {
			tx.Rollback()
			c.JSON(200, gin.H{"msg": "创建失败", "code": 200})
			return
		}
		// todo: 标签关联
		tx.Commit()
		if params.PostData.Tag != "" {
			tagsM := formatTags(int64(data.ID), params.PostData.Tag)
			dao.LinkPostTag(int64(data.ID), tagsM)
		}
	}
	if err != nil {
		c.JSON(200, gin.H{"msg": "更新失败", "code": 200})
		fmt.Println("更新失败")
		c.Abort()
		return
	}
	util.BaiduLinksubmit(data.ID) //自动提交到百度收录
	util.DelAll()                 //删除缓存
	util.SetViewCache(&data)      //更新或者添加view都设置缓存
	c.JSON(200, gin.H{"msg": msg, "code": 200, "data": params})
}

//用户登陆提交的页面
func Login(c *gin.Context) {
	id := c.PostForm("id")
	code := c.PostForm("code")
	if !server.CaptVerify(id, code) { //此处为验证码验证，后期再扩展
		c.JSON(200, gin.H{"msg": "验证码错误", "code": 400})
		c.Abort()
		return
	}
	name := c.PostForm("name")
	pwd := c.PostForm("pwd")
	conn := dao.MDB
	var u d.User
	conn.Where("name = ?", name).Find(&u)
	if util.Md5jiayan(pwd) != u.Pwd || u.Id == 0 {
		c.JSON(200, gin.H{"msg": "账号不存在或者密码错误", "code": 400})
		c.Abort()
		return
	}

	util.SetSession(c, "uid", u.Id)    //把用户的ID存进session
	util.SetSession(c, "name", u.Name) //把用户名存进session
	c.JSON(200, gin.H{"msg": "登陆成功", "code": 200})

}

func Logins(c *gin.Context) {
	c.HTML(http.StatusOK, "login1.html", gin.H{})
}

func Loginout(c *gin.Context) {
	util.NullSession(c, "uid")
	c.JSON(200, gin.H{"msg": "退出成功", "code": 200})
}

func GetCode(c *gin.Context) {
	id, b64s, err := server.CaptMake()
	if err != nil {
		fmt.Printf("错误信息是%+v", err)
	}
	c.JSON(200, gin.H{"msg": "获取成功", "code": 400, "id": id, "img": b64s})
}
