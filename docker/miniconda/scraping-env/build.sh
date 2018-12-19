#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
TAG_VERSION=${1:-dev-latest}
docker build --force-rm --no-cache -t scraping:${TAG_VERSION} ${SCRIPT_DIR}
