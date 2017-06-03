FROM mysql:5.7
MAINTAINER Lhacker <starclown1@gmail.com>

ARG ROOT_USER_PASSWORD=${ROOT_USER_PASSWORD:-root}
ARG NEW_USER_NAME=rcawaii
ARG NEW_USER_HOST=localhost
ARG NEW_USER_PASSWORD=rcawaii

RUN set -x && \
: 'setup environment' && \
  : && \
: 'start mysqld for running sql' && \
  mysqld_safe && \
  sleep 30 && \
: 'create user' && \
  mysql -uroot -p${ROOT_USER_PASSWORD} -e "create user '${NEW_USER_NAME}'@'${NEW_USER_HOST}' identified by '${NEW_USER_PASSWORD}'" && \
: 'grant permissions to the user' && \
  mysql -uroot -p${ROOT_USER_PASSWORD} -e "grant all privileges on rcawaii_local.* to '${NEW_USER_NAME}'@'${NEW_USER_HOST}'; flush privileges" && \
  :
