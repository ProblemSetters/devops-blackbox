FROM 134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/ubuntu:22.04

COPY rootfs/ /

ENV ECR=134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/ubuntu-sshd:22.04

RUN apt \
      update \
    && \
    DEBIAN_FRONTEND=noninteractive \
    apt \
      install \
        -y \
        --no-install-recommends \
        inetutils-ping \
        openssh-server \
        sudo \
    && \
    useradd \
      -m \
      -s /usr/bin/bash \
      ops; \
    printf \
      -- \
      "p@ssword\np@ssword" \
      | passwd \
          ops \
    && \
    su \
      ops \
      -c \
        "ssh-keygen -t rsa -f /home/ops/.ssh/id_rsa -N ''" \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
