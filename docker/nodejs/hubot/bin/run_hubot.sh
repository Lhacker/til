#!/bin/bash

set -e

SCRIPT_DIR=$(cd $(dirname $0); pwd)

$SCRIPT_DIR/bin/hubot -a slack
