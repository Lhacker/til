#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
IMAGE_TAG_VERSION=${1:-dev}
function input_password() {
  echo $(read -sp "root Password: " pass && echo ${pass})
  echo 1>&2
}

docker run -d --privileged rcxxxxi/mysql:${IMAGE_TAG_VERSION} 

MYSQL_VERSION=${1:-5.7}
MYSQL_ROOT_PASSWORD=$(input_password)
NAME=mysqld

docker run -d --name ${NAME} -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} -p 3306:3306 mysql:5.7
