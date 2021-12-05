#!/bin/bash

TARGET=$1

CGO=0
OS=`uname | awk '{print tolower($0)}'` # darwin | linux
ARCH=amd64

DIR=$(cd `dirname $0`;cd ..;pwd)
# 服务器IP地址
SERVERS=(root@127.0.0.1)

if [ $# -ne 1 ]
then
    echo -e "Error: expected 1 arguments, got $#\r\n"
    echo -e "Usage: \r\n\r\n ./build.sh daobin # 编译并上传\n ./build.sh daobin # 编译主程\r\n"
    exit 1
fi

upload() {
    for server in $SERVERS
    do
        echo "upload file... ${server}"
        scp $TARGET $SERVERS:/tmp/
    done
}

if [ $TARGET == "daobin" ]
then
    echo "start Build $OS $TARGET ..."
    CGO_ENABLED=$CGO GOOS=$OS GOARCH=$ARCH go build -ldflags '-w -s' -o daobin $DIR/main.go 
else
    echo -e "Usage: \r\n\r\n ./build.sh daobin # 编译并上传\n ./build.sh daobin # 编译任务队列\r\n"
    exit 1
fi

echo "Build success $DIR"

# 打开注释将上传
# upload

if [ $? -eq 0 ]
then
    # rm $TARGET

    echo "ALL SUCCESS"
fi
