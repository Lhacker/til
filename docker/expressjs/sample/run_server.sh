#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo 'Usage:'
  echo "  $0 [express version=4.14.0]"
  exit 1
}

EXPRESS_VERSION=${1:-4.14.0}
EXPRESS_APP_NAME=myapp
EXPRESS_ROOT=/express_root
EXPRESS_APP_DIR=${EXPRESS_ROOT}/${EXPRESS_APP_NAME}

HOST_EXPRESS_APP_DIR=${SCRIPT_DIR}/${EXPRESS_APP_NAME}

docker run -itd \
  --name expressjs_server \
  --hostname expressjs_server \
  -v "${HOST_EXPRESS_APP_DIR}/app.js:${EXPRESS_APP_DIR}/app.js" \
  -v "${HOST_EXPRESS_APP_DIR}/bin:${EXPRESS_APP_DIR}/bin" \
  -v "${HOST_EXPRESS_APP_DIR}/public:${EXPRESS_APP_DIR}/public" \
  -v "${HOST_EXPRESS_APP_DIR}/routes:${EXPRESS_APP_DIR}/routes" \
  -v "${HOST_EXPRESS_APP_DIR}/sslcert:${EXPRESS_APP_DIR}/sslcert" \
  -v "${HOST_EXPRESS_APP_DIR}/views:${EXPRESS_APP_DIR}/views" \
  -p "80:80" \
  -p "443:443" \
  centos:7_expressjs_${EXPRESS_VERSION}
