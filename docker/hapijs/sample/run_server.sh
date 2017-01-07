#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo 'Usage:'
  echo "  $0"
  exit 1
}

HAPI_ROOT=/hapi_root
HAPI_VERSION=latest
HAPI_ROUTES_DIR=${HAPI_ROOT}/routes

HOST_HAPI_ROUTES_DIR=${SCRIPT_DIR}/routes

docker run -itd \
  --name hapijs-dev \
  --hostname hapijs-dev \
  -v "${HOST_HAPI_ROUTES_DIR}:${HAPI_ROUTES_DIR}" \
  -p "80:80" \
  -p "443:443" \
  centos7-hapijs:${HAPI_VERSION}
