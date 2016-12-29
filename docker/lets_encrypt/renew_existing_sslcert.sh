#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo "Usage:"
  echo "  $0 [-d|--dry-run] [] [-h]"
  echo "Ex."
  echo "  $0 --dry-run"
  echo "  $0"
}

function execute_letsencrypt_docker() {
  commands="$@"
  docker run -it --rm -p 443:443 --name certbot \
    -v "${SCRIPT_DIR}/etc__letsencrypt:/etc/letsencrypt" \
    -v "${SCRIPT_DIR}/var__lib__letsencrypt:/var/lib/letsencrypt" \
    quay.io/letsencrypt/letsencrypt:latest ${commands}
}

function execute_main() {
  # directory check
  if [ ! -d ${SCRIPT_DIR}/etc__letsencrypt ] || [ ! -d ${SCRIPT_DIR}/var__lib__letsencrypt ]; then
    echo "Not found letsencrypt directories."
    echo "Once please execute ${SCRIPT_DIR}/get_sslcert.sh"
    exit 1
  fi

  # get parameters
  while [ $# -gt 0 ]; do
    arg=$1; shift
    case ${arg} in
      -d|--dry-run)
        dryrun=1
        ;;
      -f|--force)
        force=1
        ;;
      -h|--help|*)
        usage
        exit 1
        ;;
    esac
  done
  
  if [ "${dryrun}" != "" ]; then
    (set -x; execute_letsencrypt_docker renew --dry-run )
    exit 0
  elif [ "${force}" != "" ]; then
    ( set -x; execute_letsencrypt_docker renew --force-renewal )
  else
    ( set -x; execute_letsencrypt_docker renew )
  fi
}

execute_main $@
