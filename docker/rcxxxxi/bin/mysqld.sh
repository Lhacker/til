#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd ${SCRIPT_DIR}/.. && docker-compose up -d database
