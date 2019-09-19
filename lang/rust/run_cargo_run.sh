#!/bin/bash

RUST_VERSION=1.31.0

docker run --rm -e USER=root -v "$PWD":/usr/src/myapp -w /usr/src/myapp rust:$RUST_VERSION cargo run
