#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

SCRIPT_DIR=$(cd $(dirname $0); pwd)
source ${SCRIPT_DIR}/env.sh

# generate app key
cd ${SCRIPT_DIR}/../webapp
php artisan key:generate

# update app key in .env_local
sed -i "s/APP_KEY=.*/APP_KEY=$(grep 'APP_KEY=' .env)/" .env_local
