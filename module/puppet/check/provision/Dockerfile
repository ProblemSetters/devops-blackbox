FROM problemsetters/blackbox:abstract

SHELL ["/bin/bash", "-c"]

RUN source \
      /blackbox/blackbox \
        \
        &>/dev/null; \
    blackbox.framework.inventory.provision \
      puppet-agent \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
