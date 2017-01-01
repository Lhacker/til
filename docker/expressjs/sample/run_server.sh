#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo 'Usage:'
  echo "  $0"
  exit 1
}

EXPRESS_ROOT=/express_root

docker run -itd \
  --name expressjs_server \
  --hostname expressjs_server \
  -v "${HOST_EXPRESS_ROUTES_DIR}:${EXPRESS_ROUTES_DIR}" \
  -p "80:80" \
  -p "443:443" \
  centos:7_expressjs_latest \
  npm start
