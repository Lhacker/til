#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

SCRIPT_DIR=$(cd $(dirname $0); pwd)

export $(cat ${SCRIPT_DIR}/../.env)
DB_USERS_GRANTED_HOST=${RCXXXXI_WEBAPP_CONTAINER_NAME}

if [ "$(docker ps | grep ${RCXXXXI_DB_CONTAINER_NAME})" = "" ]; then
  docker-compose up -d database
  echo "sleep 5 second..." && sleep 5
fi

# drop and create database
docker exec -i ${RCXXXXI_DB_CONTAINER_NAME} \
  mysql -uroot -p${DB_ROOT_PASSWORD} -h localhost --protocol=tcp --port=${DB_PORT} \
  -e "drop database if exists ${DB_DATABASE}; create database ${DB_DATABASE} default character set utf8"

# create user
docker exec -i ${RCXXXXI_DB_CONTAINER_NAME} \
  mysql -uroot -p${DB_ROOT_PASSWORD} -h localhost --protocol=tcp --port=${DB_PORT} \
  -e " \
    drop user if exists '${DB_USER}'@'localhost'; create user '${DB_USER}'@'localhost' identified by '${DB_PASSWORD}'; \
    drop user if exists '${DB_USER}'@'${DB_USERS_GRANTED_HOST}'; create user '${DB_USER}'@'${DB_USERS_GRANTED_HOST}' identified by '${DB_PASSWORD}'; \
  "

# grant permission
docker exec -i ${RCXXXXI_DB_CONTAINER_NAME} \
  mysql -uroot -p${DB_ROOT_PASSWORD} -h localhost --protocol=tcp --port=${DB_PORT} \
  -e " \
    grant all privileges on ${DB_DATABASE}.* to '${DB_USER}'@'localhost'; \
    grant all privileges on ${DB_DATABASE}.* to '${DB_USER}'@'${DB_USERS_GRANTED_HOST}'; \
    flush privileges \
  "

echo done
