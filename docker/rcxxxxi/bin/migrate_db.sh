#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
export $(cat ${SCRIPT_DIR}/../.env)

if [ "$(docker ps -a | grep ${RCXXXXI_WEBAPP_CONTAINER_NAME})" = "" ] && [ "$(docker ps -a | grep ${RCXXXXI_MYSQL_CONTAINER_NAME})" = "" ]; then
  echo Please up webapp and database container >&2
  exit
fi

docker exec -it ${RCXXXXI_WEBAPP_CONTAINER_NAME} bash -c " \
  source /etc/profile && \
  php artisan migrate && \
  :"

echo done migration
