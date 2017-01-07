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
JENKINS_VERSION=1.651.3
JENKINS_ROOT=/jenkins
JENKINS_HOME=${JENKINS_ROOT}/data
JENKINS_BIN_DIR=${JENKINS_ROOT}/bin
JENKINS_WAR_PATH=${JENKINS_BIN_DIR}/jenkins.war
JENKINS_LOG_DIR=${JENKINS_ROOT}/log
JENKINS_ACCESS_LOG_FILE=access.log
JENKINS_ACCESS_LOG_PATH=${JENKINS_LOG_DIR}/${JENKINS_ACCESS_LOG_FILE}

HOST_JENKINS_PORT=${JENKINS_PORT}
HOST_JENKINS_HOME=${SCRIPT_DIR}/data
HOST_JENKINS_LOG_DIR=${SCRIPT_DIR}/log
mkdir -p ${HOST_JENKINS_HOME}
mkdir -p ${HOST_JENKINS_LOG_DIR}
sudo rm -f ${HOST_JENKINS_LOG_DIR}/*

docker run -itd \
  --name jenkins${JENKINS_VERSION%%.*}x \
  --hostname jenkins${JENKINS_VERSION%%.*}x \
  -p ${HOST_JENKINS_PORT}:${JENKINS_PORT} \
  -v ${HOST_JENKINS_LOG_DIR}:${JENKINS_LOG_DIR} \
  -v ${HOST_JENKINS_HOME}:${JENKINS_HOME} \
  -w ${JENKINS_HOME} \
  centos7-jenkins:${JENKINS_VERSION} \
  bash -c "java -jar ${JENKINS_WAR_PATH} \
    --httpPort=${JENKINS_PORT} \
    --accessLoggerClassName=winstone.accesslog.SimpleAccessLogger \
    --simpleAccessLogger.format=common \
    --simpleAccessLogger.file=${JENKINS_ACCESS_LOG_PATH}"
