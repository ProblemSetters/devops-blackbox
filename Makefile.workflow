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

ifneq ($(filter github:ecr:repository:initialize,$(MAKECMDGOALS)),)
  BLACKBOX_ECR_REPOSITORY_INITIALIZE=$(filter-out github:ecr:repository:initialize,$(filter-out debug,$(MAKECMDGOALS)))
  BLACKBOX_ECR_REPOSITORY_INITIALIZE_REGISTRY_ID:=134148934511
  BLACKBOX_ECR_REPOSITORY_INITIALIZE_REPOSITORY_NAME=$(or $(word 1,$(BLACKBOX_ECR_REPOSITORY_INITIALIZE)),$(error Repository name is required))
endif

ifneq ($(filter github:ecr:repository:build,$(MAKECMDGOALS)),)
  BLACKBOX_ECR_REPOSITORY_BUILD=$(filter-out github:ecr:repository:build,$(filter-out debug,$(MAKECMDGOALS)))
  BLACKBOX_ECR_REPOSITORY_BUILD_SOURCE=$(or $(word 1,$(BLACKBOX_ECR_REPOSITORY_BUILD)),$(error Repository name is required))
  BLACKBOX_ECR_REPOSITORY_BUILD_DESTINATION=$(or $(word 2,$(BLACKBOX_ECR_REPOSITORY_BUILD)),$(error Repository name is required))
endif

ifneq ($(filter github:ecr:repository:charge,$(MAKECMDGOALS)),)
  BLACKBOX_ECR_REPOSITORY_CHARGE=$(filter-out github:ecr:repository:charge,$(filter-out debug,$(MAKECMDGOALS)))
  BLACKBOX_ECR_REPOSITORY_CHARGE_SOURCE=$(or $(word 1,$(BLACKBOX_ECR_REPOSITORY_CHARGE)),$(error Repository name is required))
  BLACKBOX_ECR_REPOSITORY_CHARGE_DESTINATION=$(addprefix 134148934511.dkr.ecr.us-east-1.amazonaws.com/,$(or $(word 2,$(BLACKBOX_ECR_REPOSITORY_CHARGE)),$(error Repository name is required)))
endif

all:
	$(error Nothing to do)

debug: ;@:
	$(foreach variable,$(filter BLACKBOX_%,$(sort $(.VARIABLES))),$(info $(shell printf "\033[0;37m%s = %s\033[0m" "$(variable)" "$($(variable))")))
	$(if $(and $(filter-out $(words $(MAKECMDGOALS)),0),$(filter-out $(words $(MAKECMDGOALS)),1)),$(info $(shell printf "\033[0;37m%s\033[0m" --)))

github\:build\:blackbox:
	$(MAKE) --directory=framework/module/abstract/check/provision build

github\:build\:blackbox\:modules:
	$(foreach module,$(BLACKBOX_MODULES),$(MAKE) --directory=$(module) build;)

github\:push\:blackbox:
	$(MAKE) --directory=framework/module/abstract/check/provision push

github\:push\:blackbox\:modules:
	$(foreach module,$(BLACKBOX_MODULES),$(MAKE) --directory=$(module) push;)

github\:ecr\:repository\:initialize:
	aws ecr describe-repositories --registry-id=$(BLACKBOX_ECR_REPOSITORY_INITIALIZE_REGISTRY_ID) --repository-names $(BLACKBOX_ECR_REPOSITORY_INITIALIZE_REPOSITORY_NAME) || aws ecr create-repository --registry-id=$(BLACKBOX_ECR_REPOSITORY_INITIALIZE_REGISTRY_ID) --repository-name=$(BLACKBOX_ECR_REPOSITORY_INITIALIZE_REPOSITORY_NAME)

github\:ecr\:repository\:build:
	docker buildx build --tag="$(BLACKBOX_ECR_REPOSITORY_BUILD_DESTINATION)" "$(abspath $(addprefix .github/workflows/ecr/,$(BLACKBOX_ECR_REPOSITORY_BUILD_SOURCE)))"

github\:ecr\:repository\:charge:
	docker manifest inspect $(BLACKBOX_ECR_REPOSITORY_CHARGE_DESTINATION) || true
	docker buildx imagetools inspect $(BLACKBOX_ECR_REPOSITORY_CHARGE_DESTINATION) || true
	docker image inspect $(BLACKBOX_ECR_REPOSITORY_CHARGE_SOURCE) || docker pull $(BLACKBOX_ECR_REPOSITORY_CHARGE_SOURCE)
	docker buildx imagetools inspect $(BLACKBOX_ECR_REPOSITORY_CHARGE_SOURCE)
	docker tag $(BLACKBOX_ECR_REPOSITORY_CHARGE_SOURCE) $(BLACKBOX_ECR_REPOSITORY_CHARGE_DESTINATION)
	docker push $(BLACKBOX_ECR_REPOSITORY_CHARGE_DESTINATION)

prune:
	docker system prune --all

%:
	@:

ifneq ($(filter debug,$(MAKECMDGOALS)),)
MAKEFLAGS+=dry-run
endif

.NOTPARALLEL:
