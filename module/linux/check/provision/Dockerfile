FROM public.ecr.aws/b0k9n8x8/problemsetters/blackbox:abstract

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
