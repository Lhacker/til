#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
PHP_VERSION=${1:-7.1.4}

docker build --force-rm --no-cache --build-arg PHP_VERSION=${PHP_VERSION} -t centos7-laravel:dev ${SCRIPT_DIR}
