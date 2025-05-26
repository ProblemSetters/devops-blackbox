FROM 134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/blackbox_2404:abstract

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
    ansible-galaxy \
      collection \
        install \
          community.aws \
        --force-with-deps \
        --collections-path \
          /usr/share/ansible; \
    tee \
      -a \
        /etc/environment < <(printf "ANSIBLE_COLLECTIONS_PATH=%s\n" "/usr/share/ansible/ansible_collections"); \
    blackbox.framework.inventory.provision \
      awscli \
    && \
    rm \
      -rf \
      /var/lib/apt/lists/*
