FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG PHP_VERSION=${PHP_VERSION}
ENV PATH ~/.phpbrew/bashrc:${PATH}

# setup environment
RUN set -x && \
: set environment && \
  yum update -y && yum clean all && \
  yum install -y php gcc openssl-devel libxml2-devel bzip2 libmcrypt-devel readline-devel && \
: install phpbrew && \
  curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew && \
  chmod +x phpbrew && \
  mv phpbrew /usr/local/bin/phpbrew && \
  phpbrew init && \
  [[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc && \
  phpbrew install ${PHP_VERSION} +default +openssl=/usr/include/openssl && \
:
