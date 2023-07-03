FROM problemsetters/blackbox_2204:abstract

SHELL ["/bin/bash", "-c"]

RUN source \
      /blackbox/blackbox \
        \
        &>/dev/null; \
    blackbox.framework.inventory.provision \
      gawk \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
