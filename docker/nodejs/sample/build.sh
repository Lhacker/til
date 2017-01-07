#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
NODEJS_VERSION=${1:-v7.0.0}
docker build --force-rm --no-cache --build-arg NODEJS_VERSION=${NODEJS_VERSION} -t centos7-nodejs:${NODEJS_VERSION} ${SCRIPT_DIR}
