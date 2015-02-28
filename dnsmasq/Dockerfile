# Original credit: https://github.com/jpetazzo/dockvpn

# Leaner build then Ubunutu
FROM phusion/baseimage

MAINTAINER Mike Balmer <me@remlabm.com>

RUN apt-get update && \
    apt-get install -y dnsmasq dnsutils && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/etc/dnsmasq.d"]

# Internally uses port 53, remap using docker
EXPOSE 53/udp

CMD ["/sbin/my_init"]

RUN mkdir -p /etc/service/dnsmasq
ADD ./service/dnsmasq.sh /etc/service/dnsmasq/run
RUN chmod +x /etc/service/dnsmasq/run

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*
