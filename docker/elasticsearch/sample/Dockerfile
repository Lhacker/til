FROM centos:7
MAINTAINER Lhacker

ENV JAVA_HOME /usr/java/default
ENV TZ Asia/Tokyo

# setup environment
RUN yum update -y && \
  mkdir -pv /usr/src/redhat/RPMS/ && \
  wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm -P /usr/src/redhat/RPMS/ && \
  yum localinstall -y /usr/src/redhat/RPMS/jdk-8u102-linux-x64.rpm

# install elasticsearch
ADD elasticsearch.repo /etc/yum.repos.d/
RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch && \
  yum install -y elasticsearch && \
  systemctl enable elasticsearch.service && \
  /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head --verbose
