#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker build \
  --force-rm \
  --no-cache \
  --build-arg USERNAME=ec2-user \
  -f $SCRIPT_DIR/Dockerfile_amazonlinux_201709 \
  -t amazonlinux-base:2017.09 \
  $SCRIPT_DIR
