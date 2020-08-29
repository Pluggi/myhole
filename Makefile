IMAGE_TAG=pluggi/unbound:latest

all: build

gen-blacklist:
	python3 unbound/gen-blacklist > unbound/blacklist.conf

build: gen-blacklist
	docker build unbound -t "$(IMAGE_TAG)"

push: build
	docker push "$(IMAGE_TAG)"
