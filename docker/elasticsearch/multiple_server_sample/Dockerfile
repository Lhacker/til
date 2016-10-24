FROM centos:7_updated
MAINTAINER Lhacker

ENV TZ JST-9
ENV JAVA_HOME /usr/java/default

# setup td-agent environment
RUN yum update -y && yum clean all && \
  yum install -y chrony && \
  systemctl enable chronyd && \
  sed -ri 's/Defaults\s+requiretty.*/#\0/' /etc/sudoers && \
  mkdir -pv /data

# install td-agent
RUN curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
ADD ./td-agent.conf.elasticsearch /etc/td-agent/td-agent.conf
RUN systemctl enable td-agent && \
  sudo td-agent-gem install fluent-plugin-elasticsearch && \
  sed -i 's/TD_AGENT_USER=td-agent/TD_AGENT_USER=root/' /etc/init.d/td-agent && \
  sed -i 's/TD_AGENT_GROUP=td-agent/TD_AGENT_GROUP=root/' /etc/init.d/td-agent

# setup elasticsearch environment
RUN mkdir -pv /usr/src/redhat/RPMS/ && \
  yum install -y wget && \
  wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm -P /usr/src/redhat/RPMS/ && \
  yum localinstall -y /usr/src/redhat/RPMS/jdk-8u102-linux-x64.rpm

# install elasticsearch
ADD elasticsearch.repo /etc/yum.repos.d/
RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch && \
  yum install -y elasticsearch && \
  systemctl enable elasticsearch.service && \
  /usr/share/elasticsearch/bin/plugin install mobz/elasticsearch-head --verbose
ADD ./elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
