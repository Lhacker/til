#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
docker build --force-rm --no-cache --build-arg WEB_ROOT=/web_root --build-arg PORT=80 -t centos:7_http-server $SCRIPT_DIR
