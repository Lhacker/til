#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd ${SCRIPT_DIR}/.. && docker-compose run webapp bash -c " \
  source ~/.bashrc && \
  php artisan migrate && \
  :"

echo done migration
