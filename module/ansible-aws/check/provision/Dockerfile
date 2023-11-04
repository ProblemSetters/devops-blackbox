FROM problemsetters/blackbox_2204:abstract

SHELL ["/bin/bash", "-c"]

RUN source \
      /blackbox/blackbox \
        \
        &>/dev/null; \
    blackbox.framework.inventory.provision \
      ansible; \
    blackbox.framework.inventory.provision \
      boto3; \
    tee \
      -a \
        /etc/environment < <(printf "AWS_URL=%s\n" "http://eu-central-1.hackerrankaws.local:4566"); \
    blackbox.framework.inventory.provision \
      awscli \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
