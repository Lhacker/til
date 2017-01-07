#!/bin/bash

set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)
LOG_DIR=/var/log/hubot

pm2 -l ${LOG_DIR}/out.log --watch ${SCRIPT_DIR}/scripts start ${SCRIPT_DIR}/run_hubot.sh
tail -f /dev/null
