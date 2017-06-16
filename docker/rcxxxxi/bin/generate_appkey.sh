#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ "$(docker ps -a | grep ${RCXXXXI_WEBAPP_CONTAINER_NAME})" = "" ] && [ "$(docker ps -a | grep ${RCXXXXI_MYSQL_CONTAINER_NAME})" = "" ]; then
  echo Please up webapp and database container >&2
  exit
fi

docker exec -it ${RCXXXXI_WEBAPP_CONTAINER_NAME} bash -c " \
  source /etc/profile && \
  composer require --no-plugins --no-scripts laravel-notification-channels/backport && \
  composer update && \
  php artisan key:generate && \
  :"

# update app key in .env_local
cd ${SCRIPT_DIR}/../rcxxxxi
sed -i "s/APP_KEY=.*/APP_KEY=$(grep 'APP_KEY=' .env)/" .env_local
