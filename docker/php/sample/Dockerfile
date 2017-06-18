FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG PHP_VERSION=${PHP_VERSION}
ENV PHPBREW_ROOT=/etc/php/.phpbrew
ENV PHPBREW_HOME=${PHPBREW_ROOT}
ENV COMPOSER_HOME=/etc/php/.composer
ENV PATH ${COMPOSER_HOME}/vendor/bin:${PATH}

# setup environment
RUN set -x && \
: set environment && \
  yum update -y && yum clean all && \
  yum install -y epel-release && \
  yum install -y php gcc openssl-devel libssl-devel httpd-devel libxml2-devel bzip2 bzip2-devel libmcrypt-devel libxslt-devel readline-devel && \
  mkdir -pv /etc/php && \
: install phpbrew && \
  curl -L -O https://github.com/phpbrew/phpbrew/raw/master/phpbrew && \
  chmod +x phpbrew && \
  mv phpbrew /usr/local/bin/phpbrew && \
  phpbrew init && \
  phpbrew install ${PHP_VERSION} +default +mysql +apxs2 +openssl=/usr -- --with-libdir=lib64 && \
  echo "source ${PHPBREW_HOME}/bashrc" > /etc/profile.d/phpbrew.sh && \
  source ${PHPBREW_HOME}/bashrc && \
  phpbrew switch ${PHP_VERSION} && \
: install composer && \
  curl -sS https://getcomposer.org/installer | php && \
  mv -v composer.phar /usr/local/bin/composer && \
:
