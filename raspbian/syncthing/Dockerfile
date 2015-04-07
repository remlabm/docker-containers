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


ADD https://github.com/syncthing/syncthing/releases/download/v0.10.30/syncthing-linux-arm-v0.10.30.tar.gz /syncthing-latest.tar.gz
RUN \
  cd /usr/local/ && \
  tar xvzf /syncthing-latest.tar.gz && \
  rm -f /syncthing-latest.tar.gz

VOLUME /config
VOLUME /media

EXPOSE 32400

CMD ["syncthing"]
