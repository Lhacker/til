#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
JENKINS_VERSION=${1:-1.651.3}

docker build --force-rm --no-cache --build-arg JENKINS_VERSION=${JENKINS_VERSION} -t centos7-jenkins:${JENKINS_VERSION} ${SCRIPT_DIR}
