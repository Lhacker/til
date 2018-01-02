#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker build --force-rm --no-cache -f $SCRIPT_DIR/Dockerfile_centos6 -t centos-base:6 $SCRIPT_DIR
