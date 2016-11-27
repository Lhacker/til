#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
MEMCACHED_VERSION=1.4.33
TAG=centos:7_memcached_${MEMCACHED_VERSION}
docker build --force-rm --no-cache --build-arg MEMCACHED_VERSION=${MEMCACHED_VERSION} -t ${TAG} ${SCRIPT_DIR}
