#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
source ${SCRIPT_DIR}/lib/input_password.sh
source ${SCRIPT_DIR}/env.sh

MYSQL_ROOT_PASSWORD=$(input_password)

docker run -d --privileged --name ${MYSQL_CONTAINER_NAME} -p 3306:3306 -v ${MYSQL_MOUNTING_VOLUME} ${MYSQL_IMAGE_NAME}
