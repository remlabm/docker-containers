# Original credit:
# http://www.htpcguides.com/install-plex-media-server-on-raspberry-pi-2/

# Leaner build then Ubunutu
FROM resin/rpi-raspbian:wheezy

MAINTAINER Mike Balmer <me@remlabm.com>

RUN apt-get update && \
    apt-get install -y locales  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

ENV SYNCTHING_VERSION 0.10.30

# https://github.com/syncthing/syncthing/releases/download/v0.10.30/syncthing-linux-arm-v0.10.30.tar.gz

RUN set -x \
    && apt-get update && apt-get install -y curl --no-install-recommends && rm -rf /var/lib/apt/lists/* \
    && tarball="syncthing-linux-arm-v${SYNCTHING_VERSION}.tar.gz" \
    && curl -SL "https://github.com/syncthing/syncthing/releases/download/v${SYNCTHING_VERSION}/"{"$tarball",sha1sum.txt.asc} -O \
    && apt-get purge -y --auto-remove curl \
    && gpg --verify sha1sum.txt.asc \
    && grep -E " ${tarball}\$" sha1sum.txt.asc | sha1sum -c - \
    && rm sha1sum.txt.asc \
    && tar -xvf "$tarball" --strip-components=1 "$(basename "$tarball" .tar.gz)"/syncthing \
    && mv syncthing /usr/local/bin/syncthing \
    && rm "$tarball"

VOLUME /config
VOLUME /media

EXPOSE 22000 8080 20125/udp

CMD ["syncthing"]
