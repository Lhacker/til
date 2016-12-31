#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
docker build --force-rm --no-cache --build-arg NODEJS_VERSION=v7.0.0 -t centos:7_nodejs_v7.0.0 $SCRIPT_DIR
