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
ADD ./td-agent.conf.src /etc/td-agent/td-agent.conf
RUN systemctl enable td-agent && \
  systemctl td-agent restart
