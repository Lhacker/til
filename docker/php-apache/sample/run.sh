#!/bin/bash

NAME=php-apache-dev

docker run -d --privileged --name ${NAME} centos7-php-apache:dev /sbin/init
docker exec -it ${NAME} /bin/bash
