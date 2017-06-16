#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ "$(docker ps -a | grep -E 'rcxxxxi-webapp')" = "" ] && [ "$(docker ps -a | grep 'rcxxxxi-database')" = "" ]; then
  echo Please up webapp and database container >&2
  exit
fi

docker exec -it rcxxxxi-webapp bash -c " \
  source /etc/profile && \
  php artisan migrate && \
  :"

echo done migration
