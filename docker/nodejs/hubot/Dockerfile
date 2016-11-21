FROM centos:7_nodejs_v7.0.0
MAINTAINER Lhacker <starclown1@gmail.com>

ENV HUBOT_DIR /myhubot
ENV HUBOT_LOG_DIR /var/log/hubot

# install hubot
RUN set -x && \
  source /etc/profile.d/nodejs.sh && \
  mkdir -pv $HUBOT_LOG_DIR && \
  mkdir -pv $HUBOT_DIR && \
  cd $HUBOT_DIR && \
  npm install -g yo generator-hubot hubot-slack pm2 && \
  sed -ri 's#downgradeRoot\(|sudoBlock\.apply#//\0#g' $(npm config get prefix)/lib/node_modules/yo/node_modules/root-check/index.js && \
  (echo No | yo hubot --owner="Lhacker <starclown1@gmail.com>" --name="bot" --adapter="slack" --defaults) && \
  pwd && ls -latrh .

# add hubot process kicker scripts
ADD bin/*.sh $HUBOT_DIR/
RUN set -x && \
  chmod u+x $HUBOT_DIR/*.sh
