FROM 134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/ubuntu:22.04

COPY rootfs/ /

ENV ECR=134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/ubuntu-sshd:22.04

RUN apt-get \
      update \
    && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get \
      install \
        -y \
        --no-install-recommends \
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
    rm \
      -rf \
      /var/lib/apt/lists/*

USER ops

RUN ssh-keygen \
      -t \
        rsa \
      -f \
        /home/ops/.ssh/id_rsa \
      -N \
        ""
