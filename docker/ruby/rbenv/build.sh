#!/bin/bash
docker build --force-rm --no-cache --build-arg RUBY_VERSION=2.3.1 -t centos:7_rbenv_2.3.1 .
