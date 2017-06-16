#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

SCRIPT_DIR=$(cd $(dirname $0); pwd)

export $(cat ${SCRIPT_DIR}/../.env)

if [ "$(docker ps | grep ${RCXXXXI_MYSQL_CONTAINER_NAME})" = "" ]; then
  docker-compose up -d database
  echo "sleep 5 second..." && sleep 5
fi

# drop and create database
docker exec -i ${RCXXXXI_MYSQL_CONTAINER_NAME} \
  mysql -uroot -p${MYSQL_ROOT_PASSWORD} -h localhost --protocol=tcp --port=${MYSQL_PORT} \
  -e "drop database if exists ${MYSQL_DATABASE}; create database ${MYSQL_DATABASE} default character set utf8"

# create user
docker exec -i ${RCXXXXI_MYSQL_CONTAINER_NAME} \
  mysql -uroot -p${MYSQL_ROOT_PASSWORD} -h localhost --protocol=tcp --port=${MYSQL_PORT} \
  -e "drop user if exists '${MYSQL_USER}'@'${MYSQL_USERS_GRANTED_HOST}'; create user '${MYSQL_USER}'@'${MYSQL_USERS_GRANTED_HOST}' identified by '${MYSQL_PASSWORD}'"

# grant permission
docker exec -i ${RCXXXXI_MYSQL_CONTAINER_NAME} \
  mysql -uroot -p${MYSQL_ROOT_PASSWORD} -h localhost --protocol=tcp --port=${MYSQL_PORT} \
  -e "grant all privileges on ${MYSQL_DATABASE}.* to '${MYSQL_USER}'@'${MYSQL_USERS_GRANTED_HOST}'; flush privileges"

#docker rm -f $(docker ps -a | grep rcxxxxi-database | awk '{print $1}')

echo done
