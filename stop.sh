#!/bin/bash
#启动配置文件名字(与启动脚本文件必须一致)
CONF_FILE="esbMoco.json"

#判断是否已经启动
PIDS=`ps -ef | grep java | grep $CONF_FILE |awk '{print $2}'`
if [ -z "$PIDS" ]; then
    echo "ERROR: The moco with $CONF_FILE has not started!!!"
    exit 1
fi

echo "Stopping moco with ${CONF_FILE} ..."
for PID in $PIDS ; do
    kill -9 $PID > /dev/null 2>&1
done

echo "INFO: start moco with ${CONF_FILE} stopped! PID: $PIDS"
