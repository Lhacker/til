#!/bin/bash

name="memcached"
image="centos:7_memcached"

docker run -d --privileged --name $name $image /sbin/init
docker exec -it $name /bin/bash
