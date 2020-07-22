#!/usr/bin/env make
override blackbox/framework/module/abstract/score/provision/:=*

SHELL:=/bin/bash

ifeq ($(origin .FEATURES),undefined)
  $(error `make` executable version "$(MAKE_VERSION)" is unsupported. GNU Make 3.82 or above is required)
endif

BLACKBOX:=problemsetters/blackbox:$(shell basename $(abspath $(firstword $(MAKEFILE_LIST))/../../../))
BLACKBOX_BUILD_ARGS=$(foreach arg, $(filter-out BLACKBOX_BUILD_ARGS,$(filter BLACKBOX BLACKBOX_%,$(sort $(.VARIABLES)))),--build-arg="$(arg)=$($(arg))") --build-arg="BUILDKIT_INLINE_CACHE=1"

build:
	DOCKER_BUILDKIT=1 docker build $(BLACKBOX_BUILD_ARGS) --cache-from="$(BLACKBOX)" --progress="plain" --tag="$(BLACKBOX)" .

run:
	docker run -it --rm $(BLACKBOX)

scan:
	docker run -it --rm --volume="/var/run/docker.sock:/var/run/docker.sock" aquasec/trivy $(BLACKBOX)

analyze:
	docker run -it --rm --volume="/var/run/docker.sock:/var/run/docker.sock" wagoodman/dive $(BLACKBOX)

push: .confirm
	docker login
	docker push $(BLACKBOX)

prune:
	docker ps -aq | xargs -r docker stop >/dev/null
	docker system prune -a --volumes

.confirm:
	@printf "Are you sure you want to continue? [y/N] "; read confirmation && [ "$${confirmation:-N}" == "y" ]
