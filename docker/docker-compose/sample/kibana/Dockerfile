FROM centos:7
MAINTAINER Lhacker

# setup environment
RUN yum update -y && \
  timedatectl set-timezone Asia/Tokyo

# install kibna
ADD kibana.repo /etc/yum.repos.d/
RUN yum install -y kibana && \
  systemctl daemon-reload && \
  systemctl enable kibana.service

CMD ["/sbin/init"]
