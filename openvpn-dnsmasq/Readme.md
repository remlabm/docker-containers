# OpenVPN with DNSmasq for Docker

OpenVPN server with dnsmasq in a Docker container complete with an EasyRSA PKI CA.

Upstream links:

* Docker Registry @ [kylemanna/openvpn](https://registry.hub.docker.com/u/kylemanna/openvpn)
* GitHub @ [kylemanna/docker-openvpn](https://github.com/kylemanna/docker-openvpn)

## Quick Start

* Create the `$OVPN_DATA` volume container, i.e. `OVPN_DATA="ovpn-data"`
* Create the `$DMASQ_DATA` volume container, i.e. `DMASQ_DATA="dmasq-data"`

        docker run --name $OVPN_DATA -v /etc/openvpn busybox
        docker run --name $DMASQ_DATA -v /etc/dnsmasq.d busybox

* Initialize the `$OVPN_DATA` container that will hold the configuration files and certificates

        docker run --volumes-from $OVPN_DATA --rm remlabm/openvpn-dnsmasq ovpn_genconfig -u udp://VPN.SERVERNAME.COM
        docker run --volumes-from $OVPN_DATA --rm -it remlabm/openvpn-dnsmasq ovpn_initpki

* Initialize the `$DMASQ_DATA` container that will hold the configuration files

        docker run --volumes-from $DMASQ_DATA remlabm/openvpn-dnsmasq dmasq_sethost <hostname>,<ip>

* Start OpenVPN/DNSmasq server process

        docker run --volumes-from $OVPN_DATA -d -p 1194:1194/udp --cap-add=NET_ADMIN remlabm/openvpn-dnsmasq

* Generate a client certificate without a passphrase

        docker run --volumes-from $OVPN_DATA --rm -it remlabm/openvpn-dnsmasq easyrsa build-client-full CLIENTNAME nopass

* Retrieve the client configuration with embedded certificates

        docker run --volumes-from $OVPN_DATA --rm remlabm/openvpn-dnsmasq ovpn_getclient CLIENTNAME > CLIENTNAME.ovpn


## How Does It Work?

Initialize the volume container using the `kylemanna/openvpn` image with the
included scripts to automatically generate:

- Diffie-Hellman parameters
- a private key
- a self-certificate matching the private key for the OpenVPN server
- an EasyRSA CA key and certificate
- a TLS auth key from HMAC security

The OpenVPN server is started with the default run cmd of `ovpn_run`

The configuration is located in `/etc/openvpn`, and the Dockerfile
declares that directory as a volume. It means that you can start another
container with the `--volumes-from` flag, and access the configuration.
The volume also holds the PKI keys and certs so that it could be backed up.

To generate a client certificate, `kylemanna/openvpn` uses EasyRSA via the
`easyrsa` command in the container's path.  The `EASYRSA_*` environmental
variables place the PKI CA under `/etc/opevpn/pki`.

Conveniently, `kylemanna/openvpn` comes with a script called `ovpn_getclient`,
which dumps an inline OpenVPN client configuration file.  This single file can
then be given to a client for access to the VPN.


## OpenVPN Details

We use `tun` mode, because it works on the widest range of devices.
`tap` mode, for instance, does not work on Android, except if the device
is rooted.

The topology used is `net30`, because it works on the widest range of OS.
`p2p`, for instance, does not work on Windows.

The UDP server uses`192.168.255.0/24` for dynamic clients by default.

The client profile specifies `redirect-gateway def1`, meaning that after
establishing the VPN connection, all traffic will go through the VPN.
This might cause problems if you use local DNS recursors which are not
directly reachable, since you will try to reach them through the VPN
and they might not answer to you. If that happens, use public DNS
resolvers like those of Google (8.8.4.4 and 8.8.8.8) or OpenDNS
(208.67.222.222 and 208.67.220.220).

