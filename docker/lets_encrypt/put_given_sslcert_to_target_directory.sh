#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

function usage() {
  echo "Usage:"
  echo "  $0 [-d|--domain domain] [-t|--target-dir dir]"
  echo "Ex."
  echo "  $0 -d example.com -t /path/to/sslcert"
  echo "Options"
  echo "  -d|--domain     domain name"
  echo "  -t|--target-dir target directory"
  echo "                  (if not found) create dir, put ssl cert there, and update permissions"
  echo "                  (if found) put ssl cert there and update  permissions"
  exit 1
}

function put_sslcert_and_update_permissions() {
  domain=$1
  target_dir=$2
  cp ${SCRIPT_DIR}/etc__letsencrypt/live/${domain}/privkey.pem ${target_dir}/${domain}.key
  cp ${SCRIPT_DIR}/etc__letsencrypt/live/${domain}/fullchain.pem ${target_dir}/${domain}.cert
  chmod 700 ${target_dir}
}

function execute_main() {
  # get parameters
  while [ $# -gt 0 ]; do
    arg=$1; shift
    case ${arg} in
      -d|--domain)
        domain=$1
        shift
        ;;
      -t|--targt-dir)
        target_dir=$1
        shift
        ;;
      -h|--help|*)
        usage
        ;;
    esac
  done

  if [ "${domain}" == "" ] || [ "${target_dir}" == "" ]; then
    usage
  fi
  
  # directory check
  if [ ! -d ${SCRIPT_DIR}/etc__letsencrypt/live/${domain} ]; then
    echo "Not found your domain certs."
    echo "Once please execute ${SCRIPT_DIR}/get_sslcert.sh"
    exit 1
  fi

  if [ ! -d ${target_dir} ]; then
    mkdir -pv ${target_dir}
  fi

  put_sslcert_and_update_permissions ${domain} ${target_dir}

  echo "Moved to ${target_dir}"
  ls -latrh ${target_dir}
}

execute_main $@
