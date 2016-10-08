#!/bin/bash

name="td-agent"
image="centos:7"

docker run -d --privileged --name $name $image /sbin/init
docker exec -it $name /bin/bash
