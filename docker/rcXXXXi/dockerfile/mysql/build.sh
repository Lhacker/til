#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
TAG_VERSION=${1:-dev}

docker build --force-rm --no-cache -t rcxxxxi-mysql:${TAG_VERSION} ${SCRIPT_DIR}
