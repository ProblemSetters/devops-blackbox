FROM problemsetters/blackbox_2204:abstract

SHELL ["/bin/bash", "-c"]

RUN source \
      /blackbox/blackbox \
        \
        &>/dev/null; \
    blackbox.framework.inventory.provision \
      terraform; \
    blackbox.framework.inventory.provision \
      terraform-local; \
    blackbox.framework.inventory.provision \
      docker-ce \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
