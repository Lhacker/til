FROM centos7-nodejs:v7.0.0
MAINTAINER Lhacker <starclown1@gmail.com>

ARG HAPI_VERSION=${HAPI_VERSION:-latest}
ARG HAPI_ROOT=${HAPI_ROOT:-/hapi_root}
ARG HAPI_SCRIPT_DIR=${HAPI_ROOT}/routes

RUN set -x && \
: 'setup environment' && \
  yum update -y && yum clean all && \
  mkdir -pv ${HAPI_ROOT} && \
  mkdir -pv ${HAPI_SCRIPT_DIR}

COPY package.json ${HAPI_ROOT}/
COPY server.js ${HAPI_ROOT}/
WORKDIR ${HAPI_ROOT}

RUN set -x && \
: 'install hapi' && \ 
  npm install hapi@${HAPI_VERSION} --save
