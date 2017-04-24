#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
APACHE_VERSION=${1:-2.4.25}

docker build --force-rm --no-cache --build-arg APACHE_VERSION=${APACHE_VERSION} -t centos7-apache:${APACHE_VERSION} ${SCRIPT_DIR}
