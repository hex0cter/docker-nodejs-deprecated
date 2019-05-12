REGISTRY  ?= hex0cter
IMAGE      = nodejs
VERSION   ?= 12.2.0
DOCKER     = $(shell docker info >/dev/null 2>&1 && echo "docker" || echo "sudo docker")

all: build

build:
	@$(DOCKER) build \
	--pull \
	--rm \
	--build-arg NODE_VERION=${VERSION} \
	--tag $(REGISTRY)/$(IMAGE):$(VERSION) \
	.

run:
	@$(DOCKER) run -it --rm --name $(IMAGE) $(REGISTRY)/$(IMAGE):$(VERSION)

push:
	@$(DOCKER) push $(REGISTRY)/$(IMAGE):$(VERSION)

pull:
	@$(DOCKER) login $(REGISTRY)
	@$(DOCKER) pull $(REGISTRY)/$(IMAGE):$(VERSION)
