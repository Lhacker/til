#!/bin/bash

NAME=redis
REDIS_VERSION=3.2.5
TAG=centos:7_redis_${REDIS_VERSION}

docker run -d --privileged --name ${NAME} ${TAG} /sbin/init
docker exec -it ${NAME} /bin/bash
