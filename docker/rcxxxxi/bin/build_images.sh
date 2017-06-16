#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}/..
docker-compose build --no-cache --force-rm $1
