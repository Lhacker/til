FROM centos:7_nodejs_v7.0.0
MAINTAINER Lhacker

ENV HUBOT_USER hubot
ENV HUBOT_DIR /home/${HUBOT_USER}/bin

# add hubot user
RUN set -x && \
  useradd -m $HUBOT_USER

USER $HUBOT_USER

# install hubot
RUN set -x && \
  mkdir -pv $HUBOT_DIR && \
  cd $HUBOT_DIR && \
  npm install yo generator-hubot && \
  yo hubot
