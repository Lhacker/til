#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
RUBY_VERSION=${1:-2.3.1}

docker build --force-rm --no-cache --build-arg RUBY_VERSION=${RUBY_VERSION} -t centos7-ruby-rbenv:${RUBY_VERSION} ${SCRIPT_DIR}
