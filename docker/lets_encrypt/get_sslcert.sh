#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo "Usage: $0 [domain name] [email]"
  echo "  $0 example.com webmaster@example.com"
}

domain_name=$1
admin_email=$2

mkdir -pv ${SCRIPT_DIR}/etc__letsencrypt ${SCRIPT_DIR}/var__lib__letsencrypt

docker run -it --rm -p 443:443 --name certbot \
            -v "${SCRIPT_DIR}/etc__letsencrypt:/etc/letsencrypt" \
            -v "${SCRIPT_DIR}/var__lib__letsencrypt:/var/lib/letsencrypt" \
            quay.io/letsencrypt/letsencrypt:latest certonly --agree-tos --non-interactive --standalone -d ${domain_name} -m ${admin_email}
