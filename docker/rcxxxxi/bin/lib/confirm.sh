#!/bin/bash

function confirm() {
  message=$1
  choise="[yY/nN]"
  while true
  do
    echo -n "${message} ${choise}: "
    read answer
    case ${answer} in
      y|Y) return 0;;
      n|N) return 1;;
      *) echo "Please choose from ${choise}";;
    esac
  done
}
