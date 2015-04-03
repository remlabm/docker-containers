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

ADD http://dev2day.de/plex-latest /
RUN \
  cd /usr/local/ && \
  dpkg -i /plex-latest && \
  rm -f /plex-latest

VOLUME /config
VOLUME /media

EXPOSE 32400

CMD ["start_pms"]
