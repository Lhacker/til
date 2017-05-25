FROM centos7-php-apache:dev
MAINTAINER Lhacker <starclown1@gmail.com>

ARG APP_ROOT=${APP_DIR:-/root}
ARG APP_NAME=rcXXXXi
ARG APP_DIR=${APP_ROOT}/${APP_NAME}

RUN set -x && \
: 'setup environment' && \
  yum update -y && yum clean all && \
  mkdir -pv ${APP_ROOT} && \
  cd ${APP_ROOT} && \
: 'install laravel' && \
  composer --no-plugins --no-scripts global require 'laravel/installer' && \
  laravel new --no-plugins --no-scripts ${APP_NAME} && \
:

COPY composer.json ${APP_DIR}
WORKDIR ${APP_DIR}

RUN set -x && \
: 'install php packages' && \
  composer update && \
: 'setup apache settings' && \
  aaa && \
:

CMD ["npm", "start"]
