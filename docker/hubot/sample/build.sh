#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
TAG_VERSION=dev

docker build --force-rm --build-arg HUBOT_CONVERSATION_PLUGIN=true --no-cache -t centos7-hubot-slack:${TAG_VERSION} ${SCRIPT_DIR}
