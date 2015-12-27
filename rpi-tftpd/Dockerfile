# Pull base image
FROM resin/rpi-raspbian:wheezy

RUN groupadd -r tftp && useradd -r -g tftp tftp

RUN apt-get update \
	&& apt-get install -y tftpd-hpa \
	&& rm -rf /var/lib/apt/lists/*

RUN mkdir /data && chown tftp:tftp /data
WORKDIR /data

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

RUN chmod +x /entrypoint.sh

# Expose ports
EXPOSE 69/tcp 69/udp

# set volume
VOLUME /images

CMD [ "tftp-server" ]