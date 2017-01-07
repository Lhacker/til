FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG RUBY_VERSION=${RUBY_VERSION}

# setup environment
RUN set -x && \
: set environment && \
  yum update -y && yum clean all && \
  yum install -y build-essensial \
    build-essential \
    curl \
    git-core \
    libcurl4-openssl-dev \
    libreadline-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    libyaml-dev \
    openssl \
    openssl-devel \
    zlib \
    zlib-devel \
    zlib1g-dev && \
: install ruby && \
  curl -O http://ftp.ruby-lang.org/pub/ruby/${RUBY_VERSION%.*}/ruby-${RUBY_VERSION}.tar.gz && \
  tar -zxvf ruby-${RUBY_VERSION}.tar.gz && \
  cd ruby-${RUBY_VERSION} && \
  ./configure --disable-install-doc && \
  make && \
  make install && \
  cd .. && \
  rm -r ruby-${RUBY_VERSION} ruby-${RUBY_VERSION}.tar.gz && \
  echo 'gem: --no-document' > /usr/local/etc/gemrc && \
: install bundler && \
  gem install bundler
