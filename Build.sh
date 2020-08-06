#/bin/bash

#Copy the new jar to the build location

cp -f java-app/target/*.jar jenkins/build/

echo "*****************************"
echo "*******BUILDING IMAGE********"
echo "*****************************"

cd jenkins/build/ && docker-compose -f docker-compose-build.yml build --no-cache

docker-compose-build.yml:

version: '3'
services:
   app:
    image: "maven-project:$BUILD_TAG"
    build:
      context: .  #### Denotes the current directory. This is given cos the docker file name is not as per standard. i.e(DockerFile)
      dockerfile: Dockerfile-Java

Dockerfile-Java:

FROM openjdk:8-jre-alpine

RUN mkdir /app

COPY *.jar /app/app.jar

CMD java -jar /app/app.jar

