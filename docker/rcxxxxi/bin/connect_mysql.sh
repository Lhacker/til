#!/bin/bash

# ref: http://dqn.sakusakutto.jp/2015/10/docker_mysqld_tutorial.html

SCRIPT_DIR=$(cd $(dirname $0); pwd)
source ${SCRIPT_DIR}/lib/input_password.sh
source ${SCRIPT_DIR}/env.sh

MYSQL_USER=$1
MYSQL_PASSWORD=$(input_password)
SQL=${@:2:($#-1)}
if [ "${SQL}" != "" ]; then SQL_OPTION="-e ${SQL}"; fi

if [ $# -lt 1 ]; then
  echo "Usage:" >&2
  echo "  $0 MYSQL_USER [SQL]" >&2
  exit 1
fi

if [ "$(docker ps -a | grep ${MYSQL_CONTAINER_NAME})" != "" ]; then
  docker exec -it ${MYSQL_CONTAINER_NAME} mysql -h localhost -P 3306 -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${SQL_OPTION}
else
  echo "Can't find mysql container. Please start the container." >&2
fi
