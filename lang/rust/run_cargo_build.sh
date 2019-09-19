#!/bin/bash

RUST_VERSION=1.31.0

docker run --rm --user "$(id -u)":"$(id -g)" -v "$PWD":/usr/src/myapp -w /usr/src/myapp rust:$RUST_VERSION cargo build --release
