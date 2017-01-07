#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker build --force-rm --no-cache -f $SCRIPT_DIR/Dockerfile_centos7 -t centos-base:7 $SCRIPT_DIR
