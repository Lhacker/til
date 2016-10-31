#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
HUBOT_SLACK_TOKEN=$1
VOL_DIR=$SCRIPT_DIR/scripts
HUBOT_DIR=/myhubot

docker run -it --rm --name hubot \
  -v $VOL_DIR:$HUBOT_DIR/scripts \
  -e HUBOT_SLACK_TOKEN=$HUBOT_SLACK_TOKEN \
  -w $HUBOT_DIR \
  centos:7_hubot \
  /bin/bash
