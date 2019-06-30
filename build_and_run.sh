#!/usr/bin/env bash
set -ex

BUILD_SCRIPT_DIR=$(dirname $(readlink -f $0))
cd $BUILD_SCRIPT_DIR

docker build -t cxx-modules-build2 -f Dockerfile .
docker run --rm --name cxx-modules-build2 cxx-modules-build2:latest
