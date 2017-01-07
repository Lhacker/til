FROM centos7-nodejs:v7.0.0
MAINTAINER Lhacker <starclown1@gmail.com>

ENV HUBOT_DIR /hubot-slack
ENV HUBOT_LOG_DIR /var/log/hubot
ARG HUBOT_CONVERSATION_PLUGIN=${HUBOT_CONVERSATION_PLUGIN:-}

RUN set -x && \
: set up environment && \
  mkdir -pv ${HUBOT_LOG_DIR} && \
  mkdir -pv ${HUBOT_DIR} && \
  npm install -g yo generator-hubot hubot-slack pm2 && \
  (if [ "${HUBOT_CONVERSATION_PLUGIN}" != "" ]; then npm install -g hubot-conversation; fi) && \
  sed -ri 's#downgradeRoot\(|sudoBlock\.apply#//\0#g' $(npm config get prefix)/lib/node_modules/yo/node_modules/root-check/index.js

WORKDIR ${HUBOT_DIR}
COPY bin/*.sh ${HUBOT_DIR}/

RUN set -x && \
  chmod u+x ${HUBOT_DIR}/*.sh && \
: install hubot && \
  (echo No | yo hubot --owner="Lhacker <starclown1@gmail.com>" --name="bot" --adapter="slack" --defaults) && \
  pwd && ls -latrh .

ENTRYPOINT ["./start_hubot_daemon.sh"]
