# Original credit:

# Leaner build then Ubunutu
FROM resin/rpi-raspbian:jessie

MAINTAINER Mike Balmer <me@remlabm.com>

RUN apt-get update && \
    apt-get install -y locales && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

# Setup locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen \
 && locale-gen

ENV SYNCTHING_VERSION 0.12.14 SYNCTHING_PATH=/opt/syncthing

RUN set -x \
  && mkdir -p ${SYNCTHING_PATH} /tmp/syncthing \
  && cd ${SYNCTHING_PATH} \
  && wget --no-verbose -O /tmp/syncthing/syncthing.tar https://github.com/syncthing/syncthing/releases/download/v${SYNCTHING_VERSION}/syncthing-linux-arm-v${SYNCTHING_VERSION}.tar.gz \
  && tar -xvf /tmp/syncthing/syncthing.tar --strip-components=1 "syncthing-linux-arm-v${SYNCTHING_VERSION}"/syncthing \
  && mv /tmp/synchting/syncthing ${SYNCTHING_PATH}/syncthing \
  && rm -rf /tmp/syncthing

ENV HOME=/config
WORKDIR ${SYNCTHING_PATH}

VOLUME /config
VOLUME /media

EXPOSE 8080 22000 21025/udp

CMD ["syncthing"]
