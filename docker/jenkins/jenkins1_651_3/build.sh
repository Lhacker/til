#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
docker build --force-rm --no-cache --build-arg JENKINS_VERSION=1.651.3 -t centos:7_jenkins_1.651.3 $SCRIPT_DIR
