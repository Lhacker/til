#!/bin/bash

NAME=memcached
MEMCACHED_VERSION=1.4.33
TAG=centos:7_memcached_${MEMCACHED_VERSION}

docker run -d --privileged --name ${NAME} ${TAG} /sbin/init
docker exec -it ${NAME} /bin/bash
