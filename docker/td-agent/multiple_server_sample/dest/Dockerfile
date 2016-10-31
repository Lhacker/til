FROM centos:7_updated
MAINTAINER Lhacker

ENV TZ JST-9

# setup environment
RUN yum update -y && yum clean all && \
  ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  yum install -y chrony && \
  systemctl enable chronyd && \
  sed -ri 's/Defaults\s+requiretty.*/#\0/' /etc/sudoers && \
  mkdir -pv /data

# install td-agent
RUN curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
ADD ./td-agent.conf.dest /etc/td-agent/td-agent.conf
RUN systemctl enable td-agent && \
  sed -i 's/TD_AGENT_USER=td-agent/TD_AGENT_USER=root/' /etc/init.d/td-agent && \
  sed -i 's/TD_AGENT_GROUP=td-agent/TD_AGENT_GROUP=root/' /etc/init.d/td-agent
