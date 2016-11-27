#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
REDIS_VERSION=3.2.5
TAG=centos:7_redis_${REDIS_VERSION}
docker build --force-rm --no-cache --build-arg REDIS_VERSION=3.2.5 -t ${TAG} ${SCRIPT_DIR}
