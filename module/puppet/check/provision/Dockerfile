FROM 134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/blackbox_2404:abstract

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
