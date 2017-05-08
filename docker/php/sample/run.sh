#!/bin/bash

PHP_VERSION=7.1.4
NAME=php-${PHP_VERSION}

docker run -d --privileged --name ${NAME} centos7-php:${PHP_VERSION} /sbin/init
docker exec -it ${NAME} /bin/bash
