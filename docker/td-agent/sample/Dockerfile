FROM centos:7
MAINTAINER Lhacker

# setup environment
RUN yum update -y && \
  timedatectl set-timezone Asia/Tokyo && \
  yum install -y chrony && \
  systemctl enable chronyd && \
  yum install sudo

# install td-agent
RUN curl -L https://toolbelt.treasuredata.com/sh/install-redhat-td-agent2.sh | sh && \
  systemctl enable td-agent && \
  systemctl td-agent start

ENTRYPOINT ["/sbin/init", "/etc/init.d/td-agent start"]
