#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

SCRIPT_DIR=$(cd $(dirname $0); pwd)
export $(cat ${SCRIPT_DIR}/../.env)

if [ "$(docker ps -a | grep ${RCXXXXI_DB_CONTAINER_NAME})" = "" ]; then
  echo "Can't find mysql container. Please start the container." >&2
fi

docker exec -it ${RCXXXXI_DB_CONTAINER_NAME} mysql -h localhost -P ${DB_PORT} --protocol=tcp -u ${DB_USER} -p${DB_PASSWORD} $@
