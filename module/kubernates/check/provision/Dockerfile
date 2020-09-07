FROM problemsetters/blackbox:abstract

SHELL ["/bin/bash", "-c"]

RUN source \
      /blackbox/blackbox \
        \
        &>/dev/null; \
    blackbox.framework.inventory.provision \
      kubernates \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
