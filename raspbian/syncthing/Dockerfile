# Original credit:
# http://www.htpcguides.com/install-plex-media-server-on-raspberry-pi-2/

# Leaner build then Ubunutu
FROM resin/rpi-raspbian:wheezy

MAINTAINER Mike Balmer <me@remlabm.com>

RUN apt-get update && \
    apt-get install -y locales && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

ENV SYNCTHING_VERSION 0.10.30

# https://github.com/syncthing/syncthing/releases/download/v0.10.30/syncthing-linux-arm-v${SYNCTHING_VERSION}.tar.gz
ADD https://github.com/syncthing/syncthing/releases/download/v0.10.30/syncthing-linux-arm-v${SYNCTHING_VERSION}.tar.gz /syncthing-latest.tar.gz

RUN set -x \
    && tar -xvf /syncthing-latest.tar.gz --strip-components=1 "syncthing-linux-arm-v${SYNCTHING_VERSION}"/syncthing \
    && mv syncthing /usr/local/bin/syncthing \
    && rm /syncthing-latest.tar.gz

VOLUME /config
VOLUME /media

EXPOSE 8080 22000 21025/udp

CMD ["syncthing"]
