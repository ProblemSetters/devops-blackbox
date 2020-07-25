FROM problemsetters/blackbox:abstract

ARG BLACKBOX_USER_NAME=ubuntu

ENV BLACKBOX_USER_NAME=${BLACKBOX_USER_NAME}

COPY rootfs/ /

SHELL ["/bin/bash", "-c"]

RUN source \
      /blackbox/blackbox \
        \
        &>/dev/null; \
    blackbox.framework.inventory.provision \
      docker-ce; \
    usermod \
      -a \
      -G \
        docker \
      ${BLACKBOX_USER_NAME} \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
