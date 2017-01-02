#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo 'Usage:'
  echo "  $0"
  exit 1
}

CONTAINER_NAME=expressjs_server
docker stop ${CONTAINER_NAME}
docker start ${CONTAINER_NAME}
