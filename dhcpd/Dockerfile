FROM alpine:latest

RUN apk add --no-cache \
	bash \
	dhcp

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

USER nobody

CMD ["docker-entrypoint.sh"]
