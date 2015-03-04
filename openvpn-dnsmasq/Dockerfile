# Original credit: https://github.com/jpetazzo/dockvpn

# Leaner build then Ubunutu
FROM phusion/baseimage

MAINTAINER Mike Balmer <me@remlabm.com>

RUN apt-get update && \
    apt-get install -y openvpn iptables git-core dnsmasq dnsutils  && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Update checkout to use tags when v3.0 is finally released
RUN git clone --depth 1 --branch v3.0.0-rc2 https://github.com/OpenVPN/easy-rsa.git /usr/local/share/easy-rsa && \
    ln -s /usr/local/share/easy-rsa/easyrsa3/easyrsa /usr/local/bin

# Needed by scripts
ENV OPENVPN /etc/openvpn
ENV EASYRSA /usr/local/share/easy-rsa/easyrsa3
ENV EASYRSA_PKI $OPENVPN/pki
ENV EASYRSA_VARS_FILE $OPENVPN/vars

VOLUME ["/etc/openvpn", "/etc/dnsmasq.d"]

# Internally uses port 1194, remap using docker
EXPOSE 1194/udp
EXPOSE 53/udp

CMD ["/sbin/my_init"]

RUN mkdir -p /etc/service/openvpn
ADD ./service/openvpn.sh /etc/service/openvpn/run
RUN chmod +x /etc/service/openvpn/run

RUN mkdir -p /etc/service/dnsmasq
ADD ./service/dnsmasq.sh /etc/service/dnsmasq/run
RUN chmod +x /etc/service/dnsmasq/run

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*
