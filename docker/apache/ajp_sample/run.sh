#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

CONTAINER_NAME=attest

docker run -itd --privileged \
  --name ${CONTAINER_NAME} \
  -p "80:80" \
  -v "${SCRIPT_DIR}/etc__httpd__logs:/etc/httpd/logs" \
  -v "${SCRIPT_DIR}/usr__local__tomcat__logs:/usr/local/tomcat/logs" \
  -v "${SCRIPT_DIR}/httpd-proxy.conf:/etc/httpd/conf.modules.d/httpd-proxy.conf" \
  centos7-apache-tomcat:dev \
  /sbin/init

echo "Login to ${CONTAINER_NAME}"
docker exec -it ${CONTAINER_NAME} /bin/bash

