#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

SCRIPT_DIR=$(cd $(dirname $0); pwd)
source ${SCRIPT_DIR}/lib/input_password.sh
source ${SCRIPT_DIR}/lib/confirm.sh
source ${SCRIPT_DIR}/env.sh

function usage() {
  echo "Usage:" >&2
  echo "  $0 MYSQL_USER" >&2
  exit 1
}

if [ $# -eq 1 ]; then usage; fi

MYSQL_NEW_USER=$1
MYSQL_USERS_GRANTED_HOST=localhost
MYSQL_DATABASE_NAME=rcawaii_local
MYSQL_ROOT_PASSWORD=$(input_password "root")
MYSQL_NEW_USER_PASSWORD=$(input_password "new user's")

# confirm input values
echo "Mysql user = ${MYSQL_NEW_USER}"
echo "Mysql database = ${MYSQL_DATABASE_NAME}"
if confirm 'Are you sure to set-up that database?'; then
  echo "Aborted" >&2
  exit 1
fi

# drop && create database
docker exec -it ${MYSQL_CONTAINER_NAME} mysql -uroot -p${MYSQL_ROOT_PASSWORD} \
  -e "drop database if exists '${MYSQL_DATABASE_NAME}; create database ${MYSQL_DATABASE_NAME} default character set utf8"

# create user
docker exec -it ${MYSQL_CONTAINER_NAME} mysql -uroot -p${MYSQL_ROOT_PASSWORD} \
  -e "create user '${MYSQL_NEW_USER}'@'${MYSQL_USERS_GRANTED_HOST}' identified by '${MYSQL_NEW_USER_PASSWORD}'"

# grant permission
docker exec -it ${MYSQL_CONTAINER_NAME} mysql -uroot -p${MYSQL_ROOT_PASSWORD} \
  -e "grant all privileges on ${MYSQL_DATABASE_NAME}.* to '${MYSQL_NEW_USER}'@'${MYSQL_USERS_GRANTED_HOST}'; flush privileges"

echo 'Done!'
