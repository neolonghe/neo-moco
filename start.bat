
@echo off
echo Start Moco...
java -version

set JAVA_VM=-XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=128m -Xms128m -Xmx128m -Xmn64m -Xss256k -XX:SurvivorRatio=6 -XX:+UseConcMarkSweepGC
set JAVA_OPTIONS=-Dio.netty.eventLoopThreads=200
java %JAVA_VM% %JAVA_OPTIONS% -jar moco-runner-1.2.0-standalone.jar http -p 8899 -c esbMoco.json

pause