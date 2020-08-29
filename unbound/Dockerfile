FROM alpine:latest

RUN apk add --no-cache \
	bash \
	unbound

COPY blacklist.conf /etc/unbound/blacklist.conf
COPY unbound.conf /etc/unbound/unbound.conf
RUN chown -R unbound:unbound /etc/unbound

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

USER unbound

CMD ["docker-entrypoint.sh"]
