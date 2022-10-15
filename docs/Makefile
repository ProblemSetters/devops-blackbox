override SHELL:=/bin/bash

all:
	shdoc ../blackbox 1>README.md
	$(foreach source,framework module,find ../$(source) -type d -printf "$(source)/%P\n" | xargs install -d; find ../$(source) -type f -printf "$(source)/%P\n" | xargs --replace="{}" $(SHELL) -c "shdoc ../{} 1>{}.md; grep -q '[^[:space:]]' {}.md || rm {}.md";)
	find . -empty -delete
prune:
	find . -mindepth 1 -not -name 'Makefile' -prune -exec rm -rf {} +
