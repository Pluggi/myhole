IMAGE_TAG=pluggi/unbound:latest

all: build

blacklist:
	python3 gen-blacklist > unbound/blacklist.conf

build: blacklist
	docker build unbound -t "$(IMAGE_TAG)"

push: build
	docker push "$(IMAGE_TAG)"
