FROM centos:7
MAINTAINER Lhacker

ENV TZ JST-9

# setup environment
RUN yum update -y && \
  ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  yum install -y chrony && \
  systemctl enable chronyd && \
  sed -ri 's/Defaults\s+requiretty.*/#\0/' /etc/sudoers

# install td-agent
RUN curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh && \
  systemctl enable td-agent
