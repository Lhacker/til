FROM centos:7_nodejs_v7.0.0
MAINTAINER Lhacker <starclown1@gmail.com>

ARG HAPI_VERSION=${HAPI_VERSION:-latest}
ARG HAPI_ROOT=${HAPI_ROOT:-/hapi_root}
ARG HAPI_SCRIPT_DIR=${HAPI_ROOT}/routes

RUN set -x && \
: 'setup environment' && \ 
  yum update -y && yum clean all && \
  mkdir ${HAPI_ROOT} && \
: 'install hapi' && \ 
  npm install hapi@${HAPI_VERSION} --save
