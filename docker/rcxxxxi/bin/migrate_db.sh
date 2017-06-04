#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

SCRIPT_DIR=$(cd $(dirname $0); pwd)
source ${SCRIPT_DIR}/lib/input_password.sh
source ${SCRIPT_DIR}/env.sh

if [ $# -eq 1 ]; then
  echo "Usage:" >&2
  echo "  $0 MYSQL_USER" >&2
  exit 1
fi

MYSQL_NEW_USER=$1
MYSQL_USERS_GRANTED_HOST=localhost
MYSQL_DATABASE_NAME=rcawaii_local
MYSQL_ROOT_PASSWORD=$(input_password "root")
MYSQL_NEW_USER_PASSWORD=$(input_password "new user's")

# create user
docker exec -it ${CONTAINER_NAME} mysql -uroot -p${MYSQL_ROOT_PASSWORD} \
  -e "create user '${NEW_USER}'@'${MYSQL_USERS_GRANTED_HOST}' identified by '${MYSQL_NEW_USER_PASSWORD}'"
docker exec -it ${CONTAINER_NAME} mysql -uroot -p${MYSQL_ROOT_PASSWORD} \
  -e "grant all privileges on ${MYSQL_DATABASE_NAME}.* to '${MYSQL_NEW_USER}'@'${MYSQL_USERS_GRANTED_HOST}'; flush privileges"

echo 'Done!'
