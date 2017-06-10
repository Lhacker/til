FROM centos7-php-apache:dev
MAINTAINER Lhacker <starclown1@gmail.com>

ARG WEBAPP_ROOT=${WEBAPP_ROOT:-/root}
ARG WEBAPP_NAME=rcxxxxi
ARG WEBAPP_DIR=${WEBAPP_ROOT}/${WEBAPP_NAME}
ARG APACHE_CONF_DIR=/etc/httpd/conf

RUN set -x && \
: 'setup environment' && \
  source ~/.bashrc && \
  yum update -y && yum clean all && \
  mkdir -pv ${WEBAPP_ROOT} && \
  cd ${WEBAPP_ROOT} && \
: 'install laravel' && \
  composer --no-plugins --no-scripts global require 'laravel/installer' && \
  composer --no-plugins --no-scripts global require 'laravel-notification-channels/backport' && \
: 'temporary fix for tty issue' && \
  sed -i 's/$process->setTty(true);/$process->setTty(false);/' /root/.composer/vendor/laravel/installer/src/NewCommand.php && \
  laravel new ${WEBAPP_NAME} && \
:

# prepare Application setting files
COPY composer.json ${WEBAPP_DIR}/
COPY http-vhost.conf ${APACHE_CONF_DIR}/conf.d/
WORKDIR ${WEBAPP_DIR}

# for 'composer update' command's vender package dependency, will copy it
RUN set -x && mkdir -v vendor/gmo
COPY vendor/gmo/ ${WEBAPP_DIR}/vendor/gmo/

RUN set -x && \
: 'install php packages' && \
  source ~/.bashrc && \
  composer update --no-scripts && \
: 'setup apache settings' && \
  : 'Nothing to do for now' && \
:
