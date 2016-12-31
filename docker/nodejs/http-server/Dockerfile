FROM centos:7_nodejs_v7.0.0
MAINTAINER Lhacker <starclown1@gmail.com>

ARG PORT=${PORT:-80}
ARG WEB_ROOT=${WEB_ROOT:-/web_root}
ARG WEB_JS_DIR=${WEB_ROOT}/js

RUN set -x && \
: 'setup environment' && \ 
:  'yum update -y && yum clean all' && \
  mkdir -pv ${WEB_ROOT} && \
  mkdir -pv ${WEB_JS_DIR} && \
: 'install http-server' && \
  source /etc/profile && \
  npm install -g http-server

ENTRYPOINT ["bash", "-c", "http-server ${WEB_ROOT} -p ${PORT}"]
