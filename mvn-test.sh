#/bin/bash

echo "***************************"
echo "******TESTING THE JAR******"
echo "***************************"

docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"

eg:
./jenkins/test/mvn-test.sh mvn test
