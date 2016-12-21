FROM centos:7_base
MAINTAINER Lhacker <starclown1@gmail.com>

ARG JENKINS_VERSION=${JENKINS_VERSION:-1.651.3}
ENV JENKINS_ROOT /jenkins
ENV JENKINS_HOME ${JENKINS_ROOT}/data
ENV JENKINS_BIN_DIR ${JENKINS_ROOT}/bin
ENV JENKINS_LOG_DIR ${JENKINS_ROOT}/log

RUN set -x && \
: 'setup environment' && \ 
  yum update -y && yum clean all && \
: 'install java' && \
  mkdir -pv /usr/src/redhat/RPMS/ && \
  wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm -P /usr/src/redhat/RPMS/ && \
  yum localinstall -y /usr/src/redhat/RPMS/jdk-8u102-linux-x64.rpm && \
: 'create jenkins root dir' && \
  mkdir -pv ${JENKINS_ROOT} && \
  mkdir -pv ${JENKINS_HOME} && \
  mkdir -pv ${JENKINS_BIN_DIR} && \
  mkdir -pv ${JENKINS_LOG_DIR}

WORKDIR ${JENKINS_BIN_DIR}

RUN set -x && \
: 'download Jenkins' && \
  wget http://mirrors.jenkins.io/war-stable/${JENKINS_VERSION}/jenkins.war
