#!/bin/bash

echo "*******************"
echo "***Pushing Image***"
echo "*******************"

IMAGE="maven-project"
DOCKER_HUB_PASS="AdiEshaan!23"
OLD_BUILD_TAG=1.2
NEW_BUILD_TAG=1.3

echo "***** Logging IN to Docker hub *****"
docker login -u avangelstech -p $DOCKER_HUB_PASS

echo "***** Tagging Image *****"
docker tag app:$OLD_BUILD_TAG avangelstech/maven-project:$NEW_BUILD_TAG
docker tag app:$OLD_BUILD_TAG avangelstech/maven-project:latest

echo "***** Pushing Image *****"
docker push avangelstech/maven-project:$NEW_BUILD_TAG
docker push avangelstech/maven-project:latest
