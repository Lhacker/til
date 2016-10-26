FROM centos:7_updated
MAINTAINER Lhacker

ENV NODEBREW_ROOT /usr/local/nodebrew
ENV PATH $NODEBREW_ROOT/current/bin:${PATH}
ENV NODEJS_VERSION v7.0.0

# setup environment
RUN yum update -y && yum clean all && \
  yum install -y perl which && \
  echo "export NODEBREW_ROOT=${NODEBREW_ROOT}" >> /etc/profile.d/nodebrew.sh && \
  echo "export PATH=${PATH}" >> /etc/profile.d/nodebrew.sh && \
  source /etc/profile.d/nodebrew.sh

# install node && nodebrew
RUN curl -L git.io/nodebrew | perl - setup && \
  nodebrew install install-binary $NODEJS_VERSION && \
  nodebrew use $NODEJS_VERSION
