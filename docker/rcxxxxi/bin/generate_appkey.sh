#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd ${SCRIPT_DIR}/.. && docker-compose run webapp bash -c " \
  source /etc/profile && \
  composer require --no-plugins --no-scripts laravel-notification-channels/backport && \
  composer update && \
  php artisan key:generate && \
  :"

# update app key in .env_local
cd ${SCRIPT_DIR}/../rcxxxxi
sed -i "s/APP_KEY=.*/APP_KEY=$(grep 'APP_KEY=' .env)/" .env_local
