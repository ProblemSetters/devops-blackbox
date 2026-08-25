#!/usr/bin/env bash
BLACKBOX_PROVISION_WITH_OPTS() {
  {
    shopt -os allexport
    . /etc/environment
    shopt -ou allexport
  }

  aws ec2 create-key-pair --key-name test --no-cli-pager
}

. <(cat /blackbox/blackbox 2>/dev/null || wget -qO- --no-cache "https://raw.githubusercontent.com/dhairya-hackerrank/devops-blackbox/2404/blackbox" || printf "echo 'error: *** blackbox is not available'; exit 1") aws setup "test"

exit 0
