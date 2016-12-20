#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo 'Usage:'
  echo "  $0 [PORT=8089]"
  exit 1
}

if [ $# -lt 0 ] || [ $# -gt 1 ]; then
  usage
fi

JENKINS_PORT=${1:-8089}
JENKINS_HOME=/jenkins
JENKINS_BIN_DIR=${JENKINS_HOME}/bin
JENKINS_WAR_PATH=${JENKINS_BIN_DIR}/jenkins.war
JENKINS_LOG_DIR=${JENKINS_HOME}/log
JENKINS_OUT_LOG_PATH=${JENKINS_LOG_DIR}/out.log

HOST_JENKINS_PORT=${JENKINS_PORT}
HOST_JENKINS_LOG_DIR=${SCRIPT_DIR}/log

docker run -itd \
  --name jenkins_1.651.3 \
  --hostname jenkins_1.651.3 \
  -p ${HOST_JENKINS_PORT}:${JENKINS_PORT} \
  -v ${HOST_JENKINS_LOG_DIR}:${JENKINS_LOG_DIR} \
  -w ${JENKINS_HOME} \
  centos:7_jenkins_1.651.3 \
  bash -c "java -jar ${JENKINS_WAR_PATH} --httpPort=${JENKINS_PORT} --logfile=${JENKINS_OUT_LOG_PATH}"
