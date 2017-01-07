#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
EXPRESS_VERSION=4.14.0
docker build --force-rm --no-cache \
  --build-arg EXPRESS_VERSION=${EXPRESS_VERSION} \
  --build-arg EXPRESS_VIEW_OPTION=vash \
  --build-arg EXPRESS_ROOT=/express_root \
  --build-arg EXPRESS_APP_NAME=myapp \
  -t centos7-expressjs:${EXPRESS_VERSION} ${SCRIPT_DIR}
