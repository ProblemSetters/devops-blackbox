FROM problemsetters/blackbox:abstract

SHELL ["/bin/bash", "-c"]

RUN source \
      /blackbox/blackbox \
        \
        &>/dev/null; \
    blackbox.framework.inventory.provision \
      docker-ce; \
    blackbox.framework.inventory.provision \
      awscli \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
