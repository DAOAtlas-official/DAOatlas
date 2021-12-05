#!/bin/bash

TARGET=$1

if [ $# -ne 1 ]
then
    echo -e "Expected 1 arguments, got $#\r\n"
    echo -e "Usage: \r\n\r\n ./deploy.sh daobin # 重启脚本\r\n"
    exit 1
fi

if [ -f /tmp/$TARGET ]; then
    echo "$GOBIN/$TARGET deploy..."
    cp $GOBIN/$TARGET{,.bak}
    mv /tmp/$TARGET $GOBIN/
    supervisorctl restart $TARGET
    echo "$TARGET ok!"
else
    echo "file not found!"
fi