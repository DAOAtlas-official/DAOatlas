package config

import (
	"flag"
	"fmt"
	"goblog/model"
	"log"
	"os"
	"path"
	"runtime"

	"github.com/spf13/viper"
)

var Configv *viper.Viper

func init() {
	var confDir string
	Configv = viper.New()

	cmd := flag.NewFlagSet(os.Args[0], flag.ContinueOnError)
	cmd.StringVar(&confDir, "conf", "", "配置文件路径")
	cmd.Parse(os.Args[1:])

	if confDir != "" {
		log.Println("命令行参数...", confDir)
		Configv.AddConfigPath(confDir)
	}

	confDir = os.Getenv("CONF_PATH")
	if confDir != "" {
		log.Println("环境变量配置...", confDir)
		Configv.AddConfigPath(confDir)
	}

	_, confDir, _, _ = runtime.Caller(0)
	confDir = path.Dir(confDir)
	log.Println("Now config dir is:", confDir)
	if confDir != "" {
		log.Println("程序配置目录...", confDir)
		Configv.AddConfigPath(confDir)
	}

	Configv.SetConfigType("json")
	Configv.SetConfigName("set")
	// Configv.SetConfigFile("config/set.json")
	Configv.WatchConfig()
	err := Configv.ReadInConfig()
	if err != nil {
		panic(fmt.Errorf("fatal error config file: %s", err))
	}
}

func GetTDK() (tdk model.Tdk) {
	tdk.Title = Configv.GetString("tdk.title")
	tdk.Keyword = Configv.GetString("tdk.keyword")
	tdk.Description = Configv.GetString("tdk.description")
	tdk.Beian = Configv.GetString("tdk.biean")
	tdk.Goan = Configv.GetString("tdk.goan")
	tdk.Goanurl = Configv.GetString("tdk.goanurl")
	tdk.Tongjiid = Configv.GetString("tdk.tonjiid")
	return
}
