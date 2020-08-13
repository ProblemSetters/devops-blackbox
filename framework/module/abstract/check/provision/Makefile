#!/usr/bin/env make
override blackbox/framework/module/abstract/check/provision/:=*

ifeq ($(origin .FEATURES),undefined)
  $(error `make` executable version "$(MAKE_VERSION)" is not supported. GNU Make 3.82 or above is required)
endif

override SHELL:=/bin/bash

ifneq ($(value SHELL),$(shell echo $$BASH))
  $(error current shell executable is not supported. GNU Bash 4.3 or above is required)
endif

BLACKBOX:=problemsetters/blackbox:$(shell basename $(abspath $(firstword $(MAKEFILE_LIST))/../../../))
BLACKBOX_USER:=1000:1000
BLACKBOX_USER_NAME:=ubuntu
BLACKBOX_USER_HOME:=/home/$(BLACKBOX_USER_NAME)
BLACKBOX_VERSION:=$(shell git rev-parse --abbrev-ref HEAD)

build:
	DOCKER_BUILDKIT=1 docker build $(foreach arg, $(filter BLACKBOX%,$(sort $(.VARIABLES))),--build-arg="$(arg)=$($(arg))") --progress="plain" --tag="$(BLACKBOX)" .

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
