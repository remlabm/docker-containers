# Original: https://bitbucket.org/inkubux/cubox-i/wiki/Plex%20Wheezy

FROM resin/rpi-raspbian:wheezy
MAINTAINER Mike Balmer <me@remlabm.com>


RUN apt-get update && \
    apt-get install -y openvpn iptables git-core dnsmasq dnsutils  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
