#!/bin/bash

NAME=memcached-dev
MEMCACHED_VERSION=1.4.33

docker run -d --privileged --name ${NAME} centos7-memcached:${MEMCACHED_VERSION} /sbin/init
docker exec -it ${NAME} /bin/bash
