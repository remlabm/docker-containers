#!/bin/bash

#
# Run the OpenVPN server normally
#

set -ex

source "$OPENVPN/ovpn_env.sh"

mkdir -p /dev/net
if [ ! -c /dev/net/tun ]; then
    mknod /dev/net/tun c 10 200
fi

if [ ! -d "$OPENVPN/ccd" ]; then
    mkdir -p /etc/openvpn/ccd
fi

# Setup NAT forwarding if requested
if [ "$OVPN_DEFROUTE" != "0" ] || [ "$OVPN_NAT" == "1" ] ; then
    iptables -t nat -C POSTROUTING -s $OVPN_SERVER -o eth0 -j MASQUERADE || {
      iptables -t nat -A POSTROUTING -s $OVPN_SERVER -o eth0 -j MASQUERADE
    }
    for i in "${OVPN_ROUTES[@]}"; do
        iptables -t nat -C POSTROUTING -s "$i" -o eth0 -j MASQUERADE || {
          iptables -t nat -A POSTROUTING -s "$i" -o eth0 -j MASQUERADE
        }
    done
fi

conf="$OPENVPN/openvpn.conf"

exec openvpn --config "$conf"
