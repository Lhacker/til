#!/bin/bash

docker build --force-rm --no-cache -f Dockerfile_centos7 -t centos:7_base .
