#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
HAPI_VERSION=latest
docker build --force-rm --no-cache --build-arg HAPI_VERSION=${HAPI_VERSION} --build-arg HAPI_ROOT=/hapi_root -t centos7-hapijs:${HAPI_VERSION} ${SCRIPT_DIR}
