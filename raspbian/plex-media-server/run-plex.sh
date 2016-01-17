#!/bin/bash

docker run -it \
    remlabm/rpi-plex-media-server:latest \
    -p 32400:32400 \
    -v /opt/configs/plex:/config \
    bash start.sh
