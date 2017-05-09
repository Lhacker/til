#!/bin/bash

NAME=laravel-dev

docker run -d --privileged --name ${NAME} centos7-laravel:dev /sbin/init
docker exec -it ${NAME} /bin/bash
