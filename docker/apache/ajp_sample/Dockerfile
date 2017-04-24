FROM centos-base:7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG APACHE_VERSION=${APACHE_VERSION}
ARG TOMCAT_VERSION=${TOMCAT_VERSION}

RUN set -x && \
: 'setup environment' && \
  yum update -y && yum clean all && \
: 'install apache' && \
  yum install -y httpd-${APACHE_VERSION} && \
: 'install java' && \
  mkdir -pv /usr/src/redhat/RPMS/ && \
  wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm -P /usr/src/redhat/RPMS/ && \
  yum localinstall -y /usr/src/redhat/RPMS/jdk-8u102-linux-x64.rpm && \
: 'install tomcat' && \
  cd /usr/local/ && \
  curl -O http://ftp.yz.yamagata-u.ac.jp/pub/network/apache/tomcat/tomcat-${TOMCAT_VERSION%%.*}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
  tar xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
  mv {apache-,}tomcat-${TOMCAT_VERSION} && \
  ln -s tomcat-${TOMCAT_VERSION} tomcat && \
  rm -rf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
  :
