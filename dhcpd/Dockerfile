FROM alpine:latest

RUN apk add --no-cache \
	bash \
	dhcp

COPY dhcpd.conf /etc/dhcpd.conf
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

CMD ["/usr/bin/docker-entrypoint.sh"]
