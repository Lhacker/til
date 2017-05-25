#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker build --force-rm --no-cache -t centos7-php-apache:dev ${SCRIPT_DIR}
