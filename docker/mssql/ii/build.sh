#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOCKER_IMAGE_NAME='ii/mssql-server-linux'
VERSION=develop

docker build --force-rm --no-cache -t ${DOCKER_IMAGE_NAME}:${VERSION} ${SCRIPT_DIR}
