#!/bin/bash

echo "********************"
echo "*** Building JAR ***"
echo "********************"

#WORKSPACE=/var/efs/containers/jenkins/workspace/pipeline-docker-maven@script

#WORKSPACE=/var/efs/podtest-data/jenkins_entp/jenkins/workspace/avangels1-pipeline-maven

WORKSPACE=/home/prok8adm/jenkins/jenkins/workspace/pipeline-docker-maven/java-app

docker run --rm -v $PWD/java-app/:/app -v /root/.m2:/root/.m2 -w /app maven:3.8.6-jdk-11  sh -c 'whoami > userFile'"$@"

#docker run --rm -v  $WORKSPACE/java-app/:/app -v /root/.m2:/root/.m2 -w /app maven:3.8.6-jdk-11 "$@"
