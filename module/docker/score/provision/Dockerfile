FROM problemsetters/blackbox:abstract

ARG BLACKBOX_USER_NAME=ubuntu

ENV BLACKBOX_USER_NAME=${BLACKBOX_USER_NAME}

COPY rootfs/ /

RUN apt-get \
      update \
    && \
    wget \
      -qO- \
      https://download.docker.com/linux/ubuntu/gpg \
        \
        | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=true apt-key \
            add \
              -; \
    add-apt-repository \
      -y \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"; \
    DEBIAN_FRONTEND=noninteractive apt-get \
      install \
        -y \
        --no-install-recommends \
        "docker-ce"; \
    usermod \
      -a \
      -G \
        docker \
      ${BLACKBOX_USER_NAME} \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
