FROM centos7-php-apache:dev
MAINTAINER Lhacker <starclown1@gmail.com>

ARG APP_ROOT=${APP_DIR:-/root}
ARG APP_NAME=rcXXXXi
ARG APP_DIR=${APP_ROOT}/${APP_NAME}
ARG APACHE_CONF_DIR=/etc/httpd/conf

RUN set -x && \
: 'setup environment' && \
  yum update -y && yum clean all && \
  mkdir -pv ${APP_ROOT} && \
  cd ${APP_ROOT} && \
: 'install laravel' && \
  composer --no-plugins --no-scripts global require 'laravel/installer' && \
  laravel new --no-plugins --no-scripts ${APP_NAME} && \
:

# prepare Application setting files
COPY composer.json ${APP_DIR}/
COPY http-vost.conf ${APACHE_CONF_DIR}/conf.d/
WORKDIR ${APP_DIR}

RUN set -x && \
: 'install php packages' && \
  composer update && \
  php artisan key:generate && \
: 'setup apache settings' && \
  : 'Nothing to do for now' && \
:
