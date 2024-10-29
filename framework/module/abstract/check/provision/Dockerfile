FROM ubuntu:22.04

COPY rootfs/ /

ENV BLACKBOX=public.ecr.aws/b0k9n8x8/problemsetters/blackbox_2204:abstract

RUN apt-get \
      update \
    && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get \
      install \
        -y \
        --no-install-recommends \
        bc \
        curl \
        dirmngr \
        gettext-base \
        git \
        gpg-agent \
        software-properties-common \
        sudo \
        unzip \
        vim \
        wget \
    && \
    echo \
      "source /etc/profile" \
        \
        | tee \
            -a \
            /root/.bashrc \
            /etc/skel/.bashrc \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*

ONBUILD ARG BLACKBOX
ONBUILD ARG BLACKBOX_USER
ONBUILD ARG BLACKBOX_USER_NAME
ONBUILD ARG BLACKBOX_USER_HOME
ONBUILD ARG BLACKBOX_VERSION

ONBUILD ENV BLACKBOX=${BLACKBOX}
ONBUILD ENV BLACKBOX_USER=${BLACKBOX_USER}
ONBUILD ENV BLACKBOX_USER_NAME=${BLACKBOX_USER_NAME}
ONBUILD ENV BLACKBOX_USER_HOME=${BLACKBOX_USER_HOME}
ONBUILD ENV BLACKBOX_VERSION=${BLACKBOX_VERSION}

ONBUILD RUN printenv \
              \
              | sort \
            && \
            if [ -z "$(getent group "$(echo "${BLACKBOX_USER}" | cut -d ":" -f 2)")" ]; then \
              groupadd \
                -g \
                  "$(echo "${BLACKBOX_USER}" | cut -d ":" -f 2)" \
                "${BLACKBOX_USER_NAME}"; \
            fi; \
            if [ -z "$(getent passwd "$(echo "${BLACKBOX_USER}" | cut -d ":" -f 1)")" ]; then \
              useradd \
                -u \
                  "$(echo "${BLACKBOX_USER}" | cut -d ":" -f 1)" \
                -g \
                  "$(echo "${BLACKBOX_USER}" | cut -d ":" -f 2)" \
                -s \
                  /bin/bash \
                -d \
                  "${BLACKBOX_USER_HOME}" \
                -m \
                "${BLACKBOX_USER_NAME}"; \
            else \
              adduser \
                "$(getent passwd "$(echo "${BLACKBOX_USER}" | cut -d ":" -f 1)" | cut -d ":" -f 1)" \
                "$(getent group "$(echo "${BLACKBOX_USER}" | cut -d ":" -f 2)" | cut -d ":" -f 1)"; \
              usermod \
                "$(getent passwd "$(echo "${BLACKBOX_USER}" | cut -d ":" -f 1)" | cut -d ":" -f 1)" \
                -d \
                  "${BLACKBOX_USER_HOME}"; \
              mkhomedir_helper \
                "${BLACKBOX_USER}"; \
            fi \
            && \
            find \
              /etc/sudoers.d \
              -type \
                f \
              -exec \
                sh \
                  -c \
                    '(cat "$0") | envsubst "$(printenv | sed -e "/^BLACKBOX/!d; s/^/\${/; s/=.*/}/" | sed -e ":a;N;\$!ba;s/\n/ /g")" >"$0"' "{}" \; \
            && \
            curl \
              -H \
                "Cache-Control: no-cache, no-store" \
              -H \
                "Pragma: no-cache" \
              "https://codeload.github.com/ProblemSetters/devops-blackbox/zip/refs/heads/${BLACKBOX_VERSION}" \
              --output \
                /tmp/blackbox; \
            unzip \
              /tmp/blackbox \
              -d \
                /tmp; \
            mv \
              "/tmp/devops-blackbox-${BLACKBOX_VERSION}" \
              /blackbox; \
            rm \
              -rf \
              /tmp/*blackbox*

ONBUILD WORKDIR ${BLACKBOX_USER_HOME}
