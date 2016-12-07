#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
docker build --force-rm --build-arg HUBOT_CONVERSATION_PLUGIN=true --no-cache -t centos:7_hubot $SCRIPT_DIR
