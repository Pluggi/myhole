FROM alpine:latest

RUN apk add --no-cache \
	bash \
	bind

#ADD https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts

RUN set -ex; \
	\
	install -m 700 -o named -g named -d /var/cache/bind; \
	install -m 700 -o named -g named -d /etc/bind;

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

#RUN addgroup named && adduser -G named named
USER named

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
