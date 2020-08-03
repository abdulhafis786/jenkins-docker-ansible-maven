#/bin/bash

echo "************************"
echo "******BUILDING JAR******"
echo "************************"

docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@" ---->  this will take any parameter that is passed while script is executed.

eg: root@ip-172-31-43-99:~/jenkins-data/pipeline# ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
