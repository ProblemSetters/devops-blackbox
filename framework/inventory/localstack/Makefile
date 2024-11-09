#!/usr/bin/env make
override blackbox/framework/inventory/localstack/:=*

ifeq ($(origin .FEATURES),undefined)
  $(error `make` executable version "$(MAKE_VERSION)" is not supported. GNU Make 3.82 or above is required)
endif

override SHELL:=/bin/bash

ifneq ($(value SHELL),$(shell echo $$BASH))
  $(error current shell executable is not supported. GNU Bash 4.3 or above is required)
endif

BLACKBOX:=public.ecr.aws/b0k9n8x8/problemsetters/localstack_2204:latest

build:
	docker build --network=host --progress="plain" --tag="$(BLACKBOX)" .

run:
	docker run -it --rm $(BLACKBOX)

scan:
	docker run -it --rm --volume="/var/run/docker.sock:/var/run/docker.sock" aquasec/trivy $(BLACKBOX)

analyze:
	docker run -it --rm --volume="/var/run/docker.sock:/var/run/docker.sock" wagoodman/dive $(BLACKBOX)

push:
	docker push $(BLACKBOX)

prune:
	docker ps -aq | xargs -r docker stop >/dev/null
	docker system prune -a --volumes
