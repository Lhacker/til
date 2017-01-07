FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG NODEBREW_ROOT=${NODEBREW_ROOT:-/usr/local/nodebrew}
ARG NODEJS_VERSION=${NODEJS_VERSION:-v7.0.0}

ENV NODEBREW_ROOT ${NODEBREW_ROOT}
ENV NODE_PATH ${NODEBREW_ROOT}/current/lib/node_modules
ENV PATH ${NODEBREW_ROOT}/current/bin:${PATH}

RUN set -x && \
: 'setup environment' && \ 
  yum update -y && yum clean all && \
  yum install -y perl which && \
: 'install node && nodebrew' && \ 
  curl -L git.io/nodebrew | perl - setup && \
  nodebrew install-binary ${NODEJS_VERSION} && \
  nodebrew use ${NODEJS_VERSION}
