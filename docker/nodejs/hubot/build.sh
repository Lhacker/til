#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
docker build --force-rm --no-cache -t centos:7_hubot $SCRIPT_DIR