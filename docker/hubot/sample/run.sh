#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo 'Usage:'
  echo "  $0 [hubot-slack token] [botname=hubot-slack] [port=9000] [image tag version=dev]"
  exit 1
}

if [ $# -lt 1 ] || [ $# -gt 4 ]; then
  usage
fi

HUBOT_SLACK_TOKEN=$1
HUBOT_NAME=${2:-hubot-slack}
HUBOT_SLACK_PORT=${3:-9000}
IMAGE_TAG_VERSION=${4:-dev}

HUBOT_DIR=/hubot-slack
HUBOT_SCRIPT_DIR=${HUBOT_DIR}/scripts
HUBOT_DAEMON_PATH=${HUBOT_DIR}/start_hubot_daemon.sh
HUBOT_LOG_DIR=/var/log/hubot

HOST_SLACK_PORT=${HUBOT_SLACK_PORT}
HOST_SCRIPT_DIR=${SCRIPT_DIR}/scripts
HOST_LOG_DIR=${SCRIPT_DIR}/log

docker run -itd \
  --name ${HUBOT_NAME} \
  --hostname ${HUBOT_NAME} \
  -e HUBOT_SLACK_TOKEN=${HUBOT_SLACK_TOKEN} \
  -e PORT=${HUBOT_SLACK_PORT} \
  -p ${HOST_SLACK_PORT}:${HUBOT_SLACK_PORT} \
  -v ${HOST_SCRIPT_DIR}:${HUBOT_SCRIPT_DIR} \
  -v ${HOST_LOG_DIR}:${HUBOT_LOG_DIR} \
  -w ${HUBOT_DIR} \
  centos7-hubot-slack:${IMAGE_TAG_VERSION}
