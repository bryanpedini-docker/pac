#!/usr/bin/env bash

set -e

docker run \
    --rm \
    --shm-size 256M \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.Xauthority:/home/user/.Xauthority \
    bryanpedini/pac
