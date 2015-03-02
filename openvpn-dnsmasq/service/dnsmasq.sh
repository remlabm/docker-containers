#!/bin/sh

dnsmasq -u root -D -b -h -r /etc/resolv.conf -7 /etc/dnsmasq.d -a 127.0.0.1,192.168.255.1 -d
