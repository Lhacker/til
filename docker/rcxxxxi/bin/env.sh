#!/bin/bash
_MYSQL_IMAGE_BASE_NAME=rcxxxxi-mysql
_MYSQL_IMAGE_TAG_VERSION=dev
MYSQL_IMAGE_NAME=${_MYSQL_IMAGE_BASE_NAME}:${_MYSQL_IMAGE_TAG_VERSION}
MYSQL_CONTAINER_NAME=${_MYSQL_IMAGE_BASE_NAME}-${_MYSQL_IMAGE_TAG_VERSION}
MYSQL_MOUNTING_VOLUME="$(pwd)/../data:/var/lib/mysql"
