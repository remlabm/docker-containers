# Original credit:
# http://www.htpcguides.com/install-plex-media-server-on-raspberry-pi-2/

# Leaner build then Ubunutu
FROM resin/rpi-raspbian:wheezy

MAINTAINER Mike Balmer <me@remlabm.com>

RUN apt-get update && \
    apt-get install -y locales libexpat1  && \
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
EXPOSE 1900/udp
EXPOSE 3005
EXPOSE 5353/udp
EXPOSE 8324
EXPOSE 32410/udp
EXPOSE 32412/udp
EXPOSE 32413/udp
EXPOSE 32414/udp
EXPOSE 32469

ENV HOME /config
ENV TMPDIR /tmp

CMD ["start_pms"]
