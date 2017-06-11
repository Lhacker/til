FROM centos7-php:5.6.30
MAINTAINER Lhacker <starclown1@gmail.com>

RUN set -x && \
  source /etc/profile && \
: 'setup environment' && \
  yum update -y && yum clean all && \
: 'install httpd' && \
  yum install -y httpd mod_ssl && \
  systemctl enable httpd.service && \
:
