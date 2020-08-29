UNBOUND_TAG=pluggi/unbound:latest
DHCPD_TAG=pluggi/dhcpd:latest

all: build

blacklist:
	python3 gen-blacklist > unbound/blacklist.conf

build: blacklist
	docker build dhcpd -t "$(DHCPD_TAG)"
	docker build unbound -t "$(UNBOUND_TAG)"

push: build
	docker push "$(DHCPD_TAG)"
	docker push "$(UNBOUND_TAG)"
