#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
MEMCACHED_VERSION=1.4.33

docker build --force-rm --no-cache --build-arg MEMCACHED_VERSION=${MEMCACHED_VERSION} -t centos7-memcached:${MEMCACHED_VERSION} ${SCRIPT_DIR}
