FROM centos:7_base
MAINTAINER Lhacker <starclown1@gmail.com>

ARG CERTBOT_BASE_DIR=/root

RUN set -x && \
: 'setup environment' && \ 
  yum update -y && yum clean all && \
  yum install -y git && \
  mkdir -pv ${CERTBOT_BASE_DIR} && \
  cd ${CERTBOT_BASE_DIR} && \
  git clone https://github.com/certbot/certbot.git && \
  cd certbot && \
  ./certbot-auto certonly --agree-tos --non-interactive --standalone -d kiramarsa.xyz -m shinedwildrock@yahoo.co.jp

