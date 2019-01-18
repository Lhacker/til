FROM centos-php:${PHP_VERSION}
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
  composer --no-plugins --no-scripts global require 'laravel/installer' && \
  laravel new --no-plugins --no-scripts ${APP_NAME} && \
:
