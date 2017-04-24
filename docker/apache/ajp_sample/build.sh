#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

APACHE_VERSION=2.4.6
TOMCAT_VERSION=8.5.9

docker build --force-rm --no-cache --build-arg TOMCAT_VERSION=${TOMCAT_VERSION} --build-arg APACHE_VERSION=${APACHE_VERSION} -t centos7-apache-tomcat:dev ${SCRIPT_DIR}
