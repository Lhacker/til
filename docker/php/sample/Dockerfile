FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG PHP_VERSION=${PHP_VERSION}
ENV PATH ~/.composer/vendor/bin:~/.phpbrew/bashrc:${PATH}

# setup environment
RUN set -x && \
: set environment && \
  yum update -y && yum clean all && \
  yum install -y epel-release && \
  yum install -y php gcc openssl-devel libssl-devel httpd-devel libxml2-devel bzip2 bzip2-devel libmcrypt-devel libxslt-devel readline-devel && \
: install phpbrew && \
  curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew && \
  chmod +x phpbrew && \
  mv phpbrew /usr/local/bin/phpbrew && \
  phpbrew init && \
  phpbrew install ${PHP_VERSION} +default +apxs2 +openssl=/usr -- --with-libdir=lib64 && \
  phpbrew switch ${PHP_VERSION} && \
: install composer && \
  curl -sS https://getcomposer.org/installer | php && \
  mv -v composer.phar /usr/local/bin/composer && \
:
