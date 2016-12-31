#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo 'Usage:'
  echo "  $0 [expose_http-port:80]"
  exit 1
}

if [ $# -gt 1 ]; then
  usage
  exit 1
fi

PORT=80
WEB_ROOT=/web_root
HOST_PORT=${1:-80}
HOST_WEB_ROOT=${SCRIPT_DIR}/web_root

docker run -itd \
  --name http-server \
  --hostname http-server \
  -v "${HOST_WEB_ROOT}:${WEB_ROOT}" \
  -p "${HOST_PORT}:${PORT}" \
  centos:7_http-server
