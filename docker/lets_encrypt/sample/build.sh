#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
docker build --force-rm --no-cache --build-arg -t centos:7_lets_encrypt $SCRIPT_DIR
