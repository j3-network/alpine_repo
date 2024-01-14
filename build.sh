#!/bin/sh

ALPINE_VERSION=${ALPINE_VERSION:-3.18}

docker run \
    --rm \
    --volume /home/justin/src/j3_alpine:/home/j3 \
    --dns 1.1.1.1 \
    justinian/j3_alpine_builder:latest \
    abuild -rc -P "/home/j3/packages/${ALPINE_VERSION}"
