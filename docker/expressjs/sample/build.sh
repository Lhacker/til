#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
EXPRESS_VERSION=latest
docker build --force-rm --no-cache --build-arg EXPRESS_VERSION=${EXPRESS_VERSION} --build-arg EXPRESS_ROOT=/express_root -t centos:7_expressjs_${EXPRESS_VERSION} ${SCRIPT_DIR}
