#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo 'Usage:'
  echo "  $0 <HUBOT_SLACK_TOKEN> <(optional) PORT>"
  exit 1
}

HUBOT_SLACK_TOKEN=$1
HUBOT_SLACK_PORT=${2:-9000}
VOL_DIR=$SCRIPT_DIR/scripts
HUBOT_DIR=/myhubot

docker run -it --rm --name hubot \
  -e HUBOT_SLACK_TOKEN=$HUBOT_SLACK_TOKEN \
  -e PORT=$HUBOT_SLACK_PORT \
  -v $VOL_DIR:$HUBOT_DIR/scripts \
  -w $HUBOT_DIR \
  centos:7_hubot \
  /bin/bash
