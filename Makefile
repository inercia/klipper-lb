IMAGE_NAME  ?= inercia/klipper-lb
IMAGE_TAG   ?= latest

all:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

push: all
	docker push $(IMAGE_NAME):$(IMAGE_TAG)

.DEFAULT_GOAL := all
