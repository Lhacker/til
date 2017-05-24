#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

MYSQL_USER=$1
MYSQL_PASSWORD=$2
MYSQL_VERSION=${3:-5.7}
NAME=mysql_client

docker run --name ${NAME} -e MYSQL_USER=${MYSQL_USER} -e MYSQL_PASSWORD=${MYSQL_PASSWORD} mysql:${MYSQL_VERSION} mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} -h localhost -P 3306 --protocol=tcp
