FROM public.ecr.aws/b0k9n8x8/problemsetters/blackbox_2204:abstract

SHELL ["/bin/bash", "-c"]

RUN source \
      /blackbox/blackbox \
        \
        &>/dev/null; \
    blackbox.framework.inventory.provision \
      docker-ce; \
    blackbox.framework.inventory.provision \
      k3s \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
