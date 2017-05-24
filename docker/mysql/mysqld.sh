#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

function input_password() {
  echo $(read -sp "root Password: " pass && echo ${pass})
  echo 1>&2
}

MYSQL_VERSION=${1:-5.7}
MYSQL_ROOT_PASSWORD=$(input_password)
NAME=mysqld

docker run -d --name ${NAME} -e MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD} -p 3306:3306 mysql:5.7 mysqld_safe
