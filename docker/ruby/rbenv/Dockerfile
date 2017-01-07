FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG RUBY_VERSION=${RUBY_VERSION:-2.3.1}

ENV RBENV_ROOT /usr/local/src/rbenv
ENV PATH ${RBENV_ROOT}/bin:${PATH}

RUN set -x && \
: setup environment && \
  yum update -y && yum clean all && \
  yum install -y git gcc gcc-c++ openssl-devel readline-devel bzip2 make && \
: install rbenv && \
  git clone https://github.com/rbenv/rbenv.git ${RBENV_ROOT} && \
  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh && \
  source /etc/profile && \
  git clone https://github.com/rbenv/ruby-build.git /usr/local/src/rbenv/plugins/ruby-build && \
  rbenv install ${RUBY_VERSION} && \
  rbenv global ${RUBY_VERSION} && \
  rbenv rehash
