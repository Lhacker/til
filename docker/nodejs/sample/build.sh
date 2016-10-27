#!/bin/bash
docker build --force-rm --no-cache --build-arg NODEJS_VERSION=v7.0.0 -t centos:7_nodejs_v7.0.0 .
