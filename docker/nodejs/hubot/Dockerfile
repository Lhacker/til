FROM centos:7_nodejs_v7.0.0
MAINTAINER Lhacker

ENV HUBOT_DIR /myhubot

# install hubot
RUN set -x && \
  source /etc/profile.d/nodejs.sh && \
  mkdir -pv $HUBOT_DIR && \
  cd $HUBOT_DIR && \
  npm install -g yo generator-hubot hubot-slack && \
  sed -ri 's#downgradeRoot\(|sudoBlock\.apply#//\0#g' $(npm config get prefix)/lib/node_modules/yo/node_modules/root-check/index.js && \
  (echo No | yo hubot --owner="Lhacker" --name="bot" --adapter="slack" --defaults) && \
  pwd && ls -latrh .
