#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

MYSQL_USER=$1
MYSQL_PASSWORD=$2
MYSQL_VERSION=${3:-5.7}
MYSQLD_CONTAINER_NAME=mysqld

if [ $# -lt 2 ]; then
  echo "Usage:" >&2
  echo "  $0 MYSQL_USER MYSQL_PASSWORD [MYSQL_VERSION=5.7]" >&2
  exit 1
fi

if [ "$(docker ps -a | grep ${MYSQLD_CONTAINER_NAME})" != "" ]; then
  docker exec -it ${MYSQLD_CONTAINER_NAME} mysql -h localhost -P 3306 -u ${MYSQL_USER} -p${MYSQL_PASSWORD}
else
  echo "Can't find mysql container. Please start the container." >&2
fi
