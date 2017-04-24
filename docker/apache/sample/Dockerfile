FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG APACHE_VERSION=${APACHE_VERSION}

RUN set -x && \
: 'setup environment' && \
  yum update -y && yum clean all && \
  yum install -y httpd-${APACHE_VERSION} && \
  :
