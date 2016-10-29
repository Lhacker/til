#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
VOL_DIR=${1:-$SCRIPT_DIR/scripts}
HUBOT_DIR=/myhubot
docker run -it --rm --name hubot -v $VOL_DIR:$HUBOT_DIR/scripts -w $HUBOT_DIR centos:7_hubot /bin/bash
