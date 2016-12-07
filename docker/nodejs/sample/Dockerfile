FROM centos:7_base
MAINTAINER Lhacker <starclown1@gmail.com>

ARG NODEBREW_ROOT=${NODEBREW_ROOT:-/usr/local/nodebrew}
ARG NODEJS_VERSION=${NODEJS_VERSION:-v7.0.0}

RUN set -x && \
: 'setup environment' && \ 
  yum update -y && yum clean all && \
  yum install -y perl which && \
: 'set nodebrew env' && \
  echo "export NODEBREW_ROOT=${NODEBREW_ROOT}" >> /etc/profile.d/nodejs.sh && \
  echo "export PATH=${NODEBREW_ROOT}/current/lib/node_modules:${NODEBREW_ROOT}/current/bin:\${PATH}" >> /etc/profile.d/nodejs.sh && \
  source /etc/profile.d/nodejs.sh && \
: 'install node && nodebrew' && \ 
  curl -L git.io/nodebrew | perl - setup && \
  nodebrew install-binary $NODEJS_VERSION && \
  nodebrew use $NODEJS_VERSION
