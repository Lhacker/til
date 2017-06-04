#!/bin/bash
function input_password() {
  echo $(read -sp "$1 password: " pass && echo ${pass})
  echo 1>&2
}
