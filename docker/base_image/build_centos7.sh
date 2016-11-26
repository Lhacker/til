#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker build --force-rm --no-cache -f $SCRIPT_DIR/Dockerfile_centos7 -t centos:7_base $SCRIPT_DIR
