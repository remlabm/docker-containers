# Original credit: https://github.com/jpetazzo/dockvpn

# Leaner build then Ubunutu
FROM phusion/baseimage

MAINTAINER Mike Balmer <me@remlabm.com>

RUN apt-get update && \
    apt-get install -y openvpn iptables git-core dnsmasq dnsutils  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
