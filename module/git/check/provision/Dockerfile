FROM problemsetters/blackbox:abstract

SHELL ["/bin/bash", "-c"]

RUN source \
      /blackbox/blackbox \
        \
        &>/dev/null; \
    blackbox.framework.inventory.provision \
      git \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
