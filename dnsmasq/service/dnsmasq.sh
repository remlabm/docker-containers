#!/bin/sh

dnsmasq -u root -D -b -r /etc/resolv.conf -7 /etc/dnsmasq.d -d
