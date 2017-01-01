FROM centos:7_nodejs_v7.0.0
MAINTAINER Lhacker <starclown1@gmail.com>

ARG EXPRESS_VERSION=${EXPRESS_VERSION:-latest}
ARG EXPRESS_VIEW_OPTION=${EXPRESS_VIEW_OPTION:-vash}
ARG EXPRESS_ROOT=${EXPRESS_ROOT:-/express_root}
ARG EXPRESS_APP_NAME=${EXPRESS_APP_NAME:-myapp}
ARG EXPRESS_APP_DIR=${EXPRESS_ROOT}/${EXPRESS_APP_NAME}

RUN set -x && \
: 'setup environment' && \ 
  yum update -y && yum clean all && \
  mkdir -pv ${EXPRESS_ROOT}

WORKDIR ${EXPRESS_ROOT}

RUN set -x && \
: 'install express' && \ 
  npm install -g express-generator@${EXPRESS_VERSION} && \
  express -v ${EXPRESS_VIEW_OPTION} ${EXPRESS_APP_NAME} && \
  cd ${EXPRESS_APP_DIR} && \
  sed -i 's/^  }$/  },/g' package.json && \
  sed -i '/^}$/i\  "license": "MIT"/' package.json && \
  npm install

CMD ["npm", "start"]
