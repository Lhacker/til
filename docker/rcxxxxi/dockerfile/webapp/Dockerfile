FROM centos7-php-apache:dev
MAINTAINER Lhacker <starclown1@gmail.com>

ARG WEBAPP_ROOT=${WEBAPP_ROOT:-/root}
ARG WEBAPP_NAME=rcxxxxi}
ARG WEBAPP_DIR=${WEBAPP_ROOT}/${WEBAPP_NAME}
ARG APACHE_CONF_DIR=/etc/httpd/conf

RUN set -x && \
: 'setup environment' && \
  yum update -y && yum clean all && \
  mkdir -pv ${WEBAPP_ROOT} && \
  cd ${WEBAPP_ROOT} && \
: 'install laravel' && \
  composer --no-plugins --no-scripts global require 'laravel/installer' && \
  laravel new --no-plugins --no-scripts ${WEBAPP_NAME} && \
:

# prepare Application setting files
COPY composer.json ${WEBAPP_DIR}/
COPY http-vost.conf ${APACHE_CONF_DIR}/conf.d/
WORKDIR ${WEBAPP_DIR}

RUN set -x && \
: 'install php packages' && \
  composer update && \
  php artisan key:generate && \
: 'setup apache settings' && \
  : 'Nothing to do for now' && \
:
