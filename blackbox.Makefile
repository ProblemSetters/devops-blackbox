#!/usr/bin/env make

override SHELL:=/bin/bash
override __DIR__=$(shell cd $(shell dirname $(abspath $(firstword $(MAKEFILE_LIST))))/$(1) && pwd -P)

BLACKBOX_PATH:=$(call __DIR__,../../../blackbox)
BLACKBOX_QUESTION_PATH:=$(call __DIR__)
BLACKBOX_HOST:=blackbox-$(shell basename $(PWD) | cut -c 1-36)
BLACKBOX_HOST_USER:=1000:1000
BLACKBOX_HOST_USERNAME:=ubuntu
BLACKBOX_SPAWN:=blackbox-spawn-$(shell basename $(PWD) | cut -c 1-36)
BLACKBOX_FLAG__DEBUG_MODE:=no
BLACKBOX_FLAG__MODULES_DO_PROVISION:=yes
BLACKBOX_FLAG__MODULES_DO_BUILD:=with-blackbox
BLACKBOX_FLAG__MODULES_DO_CONFIGURE:=yes
BLACKBOX_FLAG__MODULES_DO_EVALUATE:=yes

override BLACKBOX_FLAGS=$(foreach flag, $(filter BLACKBOX_%,$(filter-out BLACKBOX_FLAGS,$(.VARIABLES))),--env="$(flag)=$(if $(filter BLACKBOX_PATH,$(flag)),/etc/blackbox,$(if $(filter BLACKBOX_QUESTION_PATH,$(flag)),/home/$(BLACKBOX_HOST_USERNAME),$($(flag))))")

all: uninstall clean install setup solution score

debug:
	$(foreach flag,$(filter BLACKBOX_%,$(sort $(.VARIABLES))),$(info $(flag) = $($(flag))))
	$(if $(filter $(words $(MAKECMDGOALS)),1),,$(info --))

install:
	docker run -dit --privileged --name $(BLACKBOX_HOST) -h $(BLACKBOX_HOST) -v $(BLACKBOX_PATH):/blackbox/:ro -v $(BLACKBOX_QUESTION_PATH)/:/home/$(BLACKBOX_HOST_USERNAME)/:rw ubuntu:bionic >/dev/null
	docker exec $(BLACKBOX_HOST) ln -s /blackbox/blackbox /dev/blackbox
	docker exec $(BLACKBOX_HOST) groupadd -g $(shell echo $(BLACKBOX_HOST_USER) | cut -d ":" -f 2) $(BLACKBOX_HOST_USERNAME)
	docker exec $(BLACKBOX_HOST) useradd -u $(shell echo $(BLACKBOX_HOST_USER) | cut -d ":" -f 1) -g $(shell echo $(BLACKBOX_HOST_USER) | cut -d ":" -f 2) -s $(SHELL) -M $(BLACKBOX_HOST_USERNAME)
	docker exec $(BLACKBOX_HOST) apt-get update
	docker exec --env DEBIAN_FRONTEND=noninteractive $(BLACKBOX_HOST) apt-get install -y --no-install-recommends software-properties-common sudo wget

setup:
	docker exec -it $(BLACKBOX_FLAGS) $(BLACKBOX_HOST) $(SHELL) /home/$(BLACKBOX_HOST_USERNAME)/setup.sh

solution:
	docker exec -it --user $(BLACKBOX_HOST_USERNAME) $(BLACKBOX_HOST) cp -rT /home/$(BLACKBOX_HOST_USERNAME)/.solution /home/$(BLACKBOX_HOST_USERNAME)/solution

score:
	docker exec -it $(BLACKBOX_FLAGS) $(BLACKBOX_HOST) $(SHELL) /home/$(BLACKBOX_HOST_USERNAME)/score.sh

shell:
	docker exec -it $(BLACKBOX_FLAGS) --env HISTFILE=/dev/null -w /home/$(BLACKBOX_HOST_USERNAME) $(BLACKBOX_HOST) $(SHELL)

shell\:spawn:
	docker exec -it $(BLACKBOX_FLAGS) --env HISTFILE=/dev/null -w /home/$(BLACKBOX_HOST_USERNAME) $(BLACKBOX_HOST) $(SHELL) -c "docker exec -it --env HISTFILE=/dev/null -w /home/$(BLACKBOX_HOST_USERNAME) $(BLACKBOX_SPAWN) $(SHELL)"

uninstall: .confirm
	docker ps -aq -f "name=$(BLACKBOX_HOST)" -f "name=$(BLACKBOX_SPAWN)" | xargs --no-run-if-empty docker rm -f >/dev/null

prune: .confirm
	docker system prune -a --volumes

clean: .confirm
	rm -rf solution

.confirm:
	printf "Are you sure you want to continue? [y/N] "; read confirmation && [ "$${confirmation:-N}" == "y" ]

ifeq ($(filter debug,$(MAKECMDGOALS)),)
.SILENT:
endif

.PHONY: solution
