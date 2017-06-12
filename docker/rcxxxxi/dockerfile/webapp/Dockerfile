FROM centos7-php-apache:dev
MAINTAINER Lhacker <starclown1@gmail.com>

ARG WEBAPP_ROOT=${WEBAPP_ROOT:-/}
ARG WEBAPP_NAME=rcxxxxi
ARG WEBAPP_DIR=${WEBAPP_ROOT}/${WEBAPP_NAME}
ARG APACHE_CONFD_DIR=/etc/httpd/conf.d/

RUN set -x && \
: 'setup environment' && \
  source /etc/profile && \
  yum update -y && yum clean all && \
  mkdir -pv ${WEBAPP_DIR} && \
: 'install laravel' && \
  composer --no-plugins --no-scripts global require 'laravel/installer' && \
: 'temporary fix for tty issue' && \
  sed -i 's/$process->setTty(true);/$process->setTty(false);/' ${COMPOSER_HOME}/vendor/laravel/installer/src/NewCommand.php && \
:

WORKDIR ${WEBAPP_DIR}

## prepare Application setting files
COPY httpd-vhost.conf ${APACHE_CONFD_DIR}/
COPY server.key ${APACHE_CONFD_DIR}/
COPY server.csr ${APACHE_CONFD_DIR}/
COPY server.crt ${APACHE_CONFD_DIR}/

# will mount app dir, so won't do these
#COPY composer.json ${WEBAPP_DIR}/
#COPY composer.lock ${WEBAPP_DIR}/
#COPY database ${WEBAPP_DIR}/database
#COPY tests ${WEBAPP_DIR}/tests
#
## for 'composer update' command's vender package dependency, will copy it
#COPY vendor/gmo ${WEBAPP_DIR}/vendor/gmo
#
#RUN set -x && \
#: 'install php packages' && \
#  source ~/.bashrc && \
#  composer require --no-scripts --no-plugins laravel-notification-channels/backport && \
#  composer update --no-scripts && \
#: 'setup apache settings' && \
#  : 'Nothing to do for now' && \
#:
