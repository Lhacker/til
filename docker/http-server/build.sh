#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
docker build --force-rm --no-cache --build-arg WEB_ROOT=/web_root --build-arg PORT=80 -t centos7-http-server:dev ${SCRIPT_DIR}
