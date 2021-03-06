#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

function input_password() {
  echo $(read -sp "root Password: " pass && echo ${pass})
  echo 1>&2
}

SCRIPT_DIR=$(cd $(dirname $0); pwd)
MYSQL_VERSION=${1:-5.7}
MYSQL_ROOT_PASSWORD=$(input_password)
NAME=mysqld

docker run -d --name ${NAME} -v ${SCRIPT_DIR}/mysql_data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} -p 3306:3306 mysql:5.7
