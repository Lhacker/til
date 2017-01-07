#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
REDIS_VERSION=${1:-3.2.5}

docker build --force-rm --no-cache --build-arg REDIS_VERSION=${REDIS_VERSION} -t centos7-redis:${REDIS_VERSION} ${SCRIPT_DIR}
