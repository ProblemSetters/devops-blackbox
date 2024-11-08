#!/usr/bin/env make
override blackbox/framework/module/abstract/check/provision/:=*

ifeq ($(origin .FEATURES),undefined)
  $(error `make` executable version "$(MAKE_VERSION)" is not supported. GNU Make 3.82 or above is required)
endif

override SHELL:=/bin/bash

ifneq ($(value SHELL),$(shell echo $$BASH))
  $(error current shell executable is not supported. GNU Bash 4.3 or above is required)
endif

BLACKBOX_MODULES:=$(abspath $(dir $(wildcard module/*/check/provision/Makefile)))

all:
	$(error Nothing to do)

debug:
	$(foreach variable,$(filter BLACKBOX_%,$(sort $(.VARIABLES))),$(info $(shell printf "\033[0;37m%s = %s\033[0m" "$(variable)" "$($(variable))")))
	$(if $(and $(filter-out $(words $(MAKECMDGOALS)),0),$(filter-out $(words $(MAKECMDGOALS)),1)),$(info $(shell printf "\033[0;37m%s\033[0m" --)))
	@true

github\:build\:blackbox:
	$(MAKE) --directory=framework/module/abstract/check/provision build

github\:build\:blackbox\:modules:
	$(foreach module,$(BLACKBOX_MODULES),$(MAKE) --directory=$(module) build;)

github\:push\:blackbox:
	$(MAKE) --directory=framework/module/abstract/check/provision push

github\:push\:blackbox\:modules:
	$(foreach module,$(BLACKBOX_MODULES),$(MAKE) --directory=$(module) push;)

prune:
	docker system prune --all

ifneq ($(filter debug,$(MAKECMDGOALS)),)
MAKEFLAGS+=dry-run
endif

.NOTPARALLEL:
