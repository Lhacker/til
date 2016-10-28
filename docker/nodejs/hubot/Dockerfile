FROM centos:7_nodejs_v7.0.0
MAINTAINER Lhacker

ENV HUBOT_DIR /myhubot

# install hubot
RUN set -x && \
  source /etc/profile.d/nodebrew.sh && \
  mkdir -pv $HUBOT_DIR && \
  cd $HUBOT_DIR && \
  npm install -g yo generator-hubot && \
  sed -ri 's#downgradeRoot\(|sudoBlock\.apply#//\0#g' $NODEBREW_ROOT/current/lib/node_modules/yo/node_modules/root-check/index.js && \
  yo hubot --owner="Lhacker" --name="bot" --description="hubot" --adapter="shell" --defaults=""
