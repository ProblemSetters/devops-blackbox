#!/usr/bin/env make
override blackbox/framework/module/abstract/score/provision/:=*

ifeq ($(origin .FEATURES),undefined)
  $(error `make` executable version "$(MAKE_VERSION)" is unsupported. GNU Make 3.82 or above is required)
endif

IMAGE_NAME=problemsetters/blackbox:abstract

build:
	DOCKER_BUILDKIT=1 docker build --build-arg="BUILDKIT_INLINE_CACHE=1" --cache-from="$(IMAGE_NAME)" --progress="plain" --tag="$(IMAGE_NAME)" .

run:
	docker run -it --rm $(IMAGE_NAME)

scan:
	docker run -it --rm --volume="/var/run/docker.sock:/var/run/docker.sock" aquasec/trivy $(IMAGE_NAME)

analyze:
	docker run -it --rm --volume="/var/run/docker.sock:/var/run/docker.sock" wagoodman/dive $(IMAGE_NAME)

push:
	docker login
	docker push $(IMAGE_NAME)

prune:
	docker ps -aq | xargs -r docker stop > /dev/null
	docker system prune -a --volumes
