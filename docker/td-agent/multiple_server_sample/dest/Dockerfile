FROM centos:7
MAINTAINER Lhacker

# setup environment
RUN yum update -y && \
  timedatectl set-timezone Asia/Tokyo && \
  yum install -y chrony && \
  systemctl enable chronyd && \
  yum install sudo

# install td-agent
RUN curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh
ADD ./td-agent.conf.dest /etc/td-agent/td-agent.conf
RUN systemctl enable td-agent && \
  sed -i 's/TD_AGENT_USER=td-agent/TD_AGENT_USER=root/' -i 's/TD_AGENT_GROUP=td-agent/TD_AGENT_GROUP=root/' /etc/inti.d/td-agent
