FROM centos:7_updated
MAINTAINER Lhacker

ENV INSTALL_RUBY_VERSION 2.3.1

# setup environment
RUN yum update -y && yum clean all && \
  yum install -y git gcc gcc-c++ openssl-devel readline-devel bzip2 make

# install rbenv
RUN git clone https://github.com/rbenv/rbenv.git /usr/local/src/rbenv && \
  echo 'export RBENV_ROOT="/usr/local/src/rbenv"' >> /etc/profile.d/rbenv.sh && \
  echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile.d/rbenv.sh && \
  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh && \
  source /etc/profile.d/rbenv.sh && \
  git clone https://github.com/rbenv/ruby-build.git /usr/local/src/rbenv/plugins/ruby-build && \
  rbenv install $INSTALL_RUBY_VERSION && \
  rbenv global $INSTALL_RUBY_VERSION && \
  rbenv rehash
