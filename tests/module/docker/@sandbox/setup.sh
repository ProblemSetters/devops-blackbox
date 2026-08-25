#!/usr/bin/env bash
BLACKBOX_PROVISION_WITH_OPTS() {
  mkdir -p /results/{setup,check}/{BLACKBOX_PROVISION_WITH_OPTS,BLACKBOX_BUILD_WITH_OPTS}
  cat >>/results/setup/BLACKBOX_PROVISION_WITH_OPTS.assert <<<"ONCE"
  cat >>/etc/environment <<<"ASSERT_ENV_VARIABLE=ONCE"
  docker pull 134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/busybox:latest
  blackbox.framework.inventory.heap.allocate && {
    cat >>file.heap <<<"ONCE"
    blackbox.framework.inventory.heap.release
  }
}

. <(cat /blackbox/blackbox 2>/dev/null || wget -qO- --no-cache "https://raw.githubusercontent.com/dhairya-hackerrank/devops-blackbox/2404/blackbox" || printf "echo 'error: *** blackbox is not available'; exit 1") docker setup "test"

cat >>/results/setup.assert <<<"ONCE"

blackbox.framework.inventory.install.file script.sh </dev/null

blackbox.framework.inventory.install.file Dockerfile </dev/null

exit 0
