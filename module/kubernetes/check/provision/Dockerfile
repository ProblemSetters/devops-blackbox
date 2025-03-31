FROM 134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/blackbox_2204:abstract

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
