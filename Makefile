REGISTRY   = hex0cter
IMAGE      = nodejs
VERSION    = latest
DOCKER     = $(shell docker info >/dev/null 2>&1 && echo "docker" || echo "sudo docker")

all: build

build:
	@$(DOCKER) build \
	--pull \
	--rm \
	--tag $(REGISTRY)/$(IMAGE):$(VERSION) \
	.

run:
	@$(DOCKER) run -it --rm --name $(IMAGE) $(REGISTRY)/$(IMAGE):$(VERSION)

push: build
        @$(DOCKER) push $(REGISTRY)/$(IMAGE):$(VERSION)

pull:
	@$(DOCKER) login $(REGISTRY)
	@$(DOCKER) pull $(REGISTRY)/$(IMAGE):$(VERSION)
