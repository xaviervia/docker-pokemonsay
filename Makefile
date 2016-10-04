IMAGE           = 'xaviervia/pokemonsay'
VERSION        ?= 1.0.0
LATEST_VERSION ?= $(VERSION)

# docker might or might not require sudo
# detect this automatically to simplify life a bit
DOCKER=$(shell docker info &>/dev/null && echo "docker" || echo "sudo docker")

all: build

build:
	@$(DOCKER) build --pull=true -t $(IMAGE):$(VERSION) ./

latest: build
	@$(DOCKER) tag $(IMAGE):$(VERSION) $(IMAGE):latest

push:
	@$(DOCKER) push $(IMAGE):$(VERSION)
	@$(DOCKER) push $(IMAGE):latest

run:
	@$(DOCKER) run -ti $(IMAGE):$(VERSION) 'こんにちは関東!'
