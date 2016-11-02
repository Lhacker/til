#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
HOST_RUNDECK_PORT=${1:-4440}

docker run -d --privileged --name rundeck_test --port 4440:4440 centos:7_rundeck /sbin/init
