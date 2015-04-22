# Original credit:

# Leaner build then Ubunutu
FROM resin/rpi-raspbian:wheezy

MAINTAINER Mike Balmer <me@remlabm.com>

RUN apt-get update && \
    apt-get install -y locales git build-essential libncurses5-dev libssl-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8

ENV LC_ALL C.UTF-8

WORKDIR /opt/aosp

RUN cd /opt/aosp && \
    git clone https://android.googlesource.com/platform/system/core.git system/core && \
    git clone https://android.googlesource.com/platform/external/zlib.git external/zlib

COPY adb /opt/aosp/system/core/adb

RUN make adb

VOLUME /media


CMD ["bash"]