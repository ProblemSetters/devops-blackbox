FROM problemsetters/blackbox:abstract

COPY rootfs/ /

SHELL ["/bin/bash", "-c"]

RUN source \
      /blackbox/blackbox \
        \
        &>/dev/null; \
    blackbox.framework.inventory.provision \
      ansible
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
