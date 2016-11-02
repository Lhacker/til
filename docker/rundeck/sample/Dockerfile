FROM centos:7_updated
MAINTAINER Lhacker

ENV JAVA_HOME /usr/java/default
ENV TZ Asia/Tokyo

# setup environment
RUN set -x && \
  yum update -y && yum clean all && \
  ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
  yum install -y wget && \
  mkdir -pv /usr/src/redhat/RPMS/ && \
  wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u102-b14/jdk-8u102-linux-x64.rpm -P /usr/src/redhat/RPMS/ && \
  yum localinstall -y /usr/src/redhat/RPMS/jdk-8u102-linux-x64.rpm

# install rundeck
RUN set -x && \
: "install rundeck" && \
  rpm --import http://rundeck.org/keys/BUILD-GPG-KEY-Rundeck.org.key && \
  rpm -Uvh http://repo.rundeck.org/latest.rpm && \
  yum install -y rundeck && \
  systemctl enable rundeckd.service && \
: "fix diff with rpm and yum" && \
  yum history sync && \
  yum clean all
