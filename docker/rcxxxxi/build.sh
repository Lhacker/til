#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
docker-compose build --no-cache --force-rm
