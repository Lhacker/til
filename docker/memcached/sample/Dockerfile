FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG MEMCACHED_VERSION=${MEMCACHED_VERSION:-1.4.33}

RUN set -x && \
: 'setup environment' && \ 
  yum update -y && yum clean all && \
  yum install -y libevent-devel && \
: 'install memcached' && \ 
  cd /usr/local/src && \
  wget http://www.memcached.org/files/memcached-${MEMCACHED_VERSION}.tar.gz && \
  tar -zxvf memcached-${MEMCACHED_VERSION}.tar.gz && \
  cd memcached-${MEMCACHED_VERSION} && \
  ./configure && make && make test && make install && \
  :
