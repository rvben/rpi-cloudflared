.PHONY: build login push certificates
DOCKER_USER = rvben
DOCKER_NAME = rvben/rpi-cloudflared
VERSION = 0.1

build:
	docker run --rm --privileged multiarch/qemu-user-static:register --reset
	docker build --no-cache=true -t $(DOCKER_NAME) .
	docker tag "$$(docker images -qa $(NAME):latest)" $(DOCKER_NAME):$(VERSION)

login:
	docker login -u=$(DOCKER_USER) -p=$(DOCKER_PASS)

push:
	docker push $(DOCKER_NAME)
