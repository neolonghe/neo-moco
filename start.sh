
#!/bin/bash
#���������ļ�����
CONF_FILE="esbMoco.json"

#�ж��Ƿ��ظ�����
PIDS=`ps -ef | grep java | grep $CONF_FILE |awk '{print $2}'`
if [ -n "$PIDS" ]; then
    echo "ERROR: The moco with $CONF_FILE alaredy started!"
    exit 1
fi

#�鿴�Ƿ���java����
java -version

JAVA_VM="-Xms128m -Xmx128m -Xmn64m -Xss256k -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=128m -XX:SurvivorRatio=6 -XX:+UseConcMarkSweepGC"
JAVA_OPTIONS="-Dio.netty.eventLoopThreads=200"
EXE_CMD="java ${JAVA_VM} ${JAVA_OPTIONS} -jar moco-runner-1.2.0-standalone.jar http -p 8899 -c ${CONF_FILE}"
echo "start command:${EXE_CMD}"

nohup ${EXE_CMD} > nohup.out 2>&1 &
echo "INFO: stop moco with ${CONF_FILE} successfully!"