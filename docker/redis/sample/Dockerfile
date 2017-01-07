FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG REDIS_VERSION=${REDIS_VERSION:-3.2.5}

RUN set -x && \
: 'setup environment' && \
  yum update -y && yum clean all && \
: 'install redis' && \
  cd /usr/local/src && \
  wget http://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz && \
  tar -zxvf redis-${REDIS_VERSION}.tar.gz && \
  cd redis-${REDIS_VERSION} && \
  make && \
  make install && \
  mkdir -v /etc/redis && \
  :
COPY redis.conf /etc/redis/
