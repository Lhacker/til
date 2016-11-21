#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo 'Usage:'
  echo "  $0 <HUBOT_SLACK_TOKEN> <(optional) PORT>"
  exit 1
}

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
  usage
fi

HUBOT_SLACK_TOKEN=$1
HUBOT_SLACK_PORT=${2:-9000}
HUBOT_DIR=/myhubot
HUBOT_SCRIPT_DIR=${HUBOT_DIR}/scripts
HUBOT_DAEMON_PATH=$HUBOT_DIR/start_hubot_daemon.sh
HUBOT_LOG_DIR=/var/log/hubot

HOST_SLACK_PORT=$HUBOT_SLACK_PORT
HOST_SCRIPT_DIR=$SCRIPT_DIR/scripts
HOST_LOG_DIR=$SCRIPT_DIR/log

docker run -itd \
  --name hubot \
  --hostname hubot \
  -e HUBOT_SLACK_TOKEN=$HUBOT_SLACK_TOKEN \
  -e PORT=$HUBOT_SLACK_PORT \
  -p ${HOST_SLACK_PORT}:${HUBOT_SLACK_PORT} \
  -v ${HOST_SCRIPT_DIR}:${HUBOT_SCRIPT_DIR} \
  -v ${HOST_LOG_DIR}:${HUBOT_LOG_DIR} \
  -w $HUBOT_DIR \
  centos:7_hubot \
  bash -c "source /etc/profile; $HUBOT_DAEMON_PATH"
