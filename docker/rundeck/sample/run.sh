#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

HOST_RUNDECK_PORT=${1:-4440}

docker run -d --privileged \
  --name rundeck-dev \
  --port ${HOST_RUNDECK_PORT}:4440 \
  centos7-rundeck:dev \
  /sbin/init
