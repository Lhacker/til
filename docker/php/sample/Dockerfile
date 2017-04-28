FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG PHP_VERSION=${PHP_VERSION}
ENV PATH ~/.phpbrew/bashrc:${PATH}

# setup environment
RUN set -x && \
: set environment && \
  yum update -y && yum clean all && \
  yum install -y epel-release && \
  yum install -y php gcc openssl-devel libssl-devel libxml2-devel bzip2 bzip2-devel libmcrypt-devel libxslt-devel readline-devel && \
: install phpbrew && \
  curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew && \
  chmod +x phpbrew && \
  mv phpbrew /usr/local/bin/phpbrew && \
  phpbrew init && \
  echo "source ~/.phpbrew/bashrc" >> ~/.bashrc && \
  echo "phpbrew use ${PHP_VERSION}" >> ~/.bashrc && \
  source ~/.phpbrew/bashrc && \
  phpbrew install ${PHP_VERSION} +default +openssl=/usr -- --with-libdir=lib64 && \
  phpbrew use ${PHP_VERSION} && \
: install composer && \
  curl -sS https://getcomposer.org/installer | php && \
  mv -v composer.phar /usr/local/bin/composer && \
:
