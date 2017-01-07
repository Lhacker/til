#!/bin/bash

NAME=redis-dev
REDIS_VERSION=3.2.5

docker run -d --privileged --name ${NAME} centos7-redis:${REDIS_VERSION} /sbin/init
docker exec -it ${NAME} /bin/bash
