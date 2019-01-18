FROM centos7-php:7.1.4
MAINTAINER Lhacker <starclown1@gmail.com>

ARG APP_DIR=${APP_DIR:-/root}
ARG APP_NAME=${APP_NAME:-HelloWorld}

# setup environment
RUN set -x && \
: set environment && \
  yum update -y && yum clean all && \
  mkdir -pv ${APP_DIR} && \
  cd ${APP_DIR} && \
: install laravel && \
  source /etc/profile.d/phpbrew.sh && \
  composer --no-plugins --no-scripts global require 'laravel/installer' && \
: laravel new -q ${APP_NAME} && \
:
