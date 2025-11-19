#!/usr/bin/env bash
cat <<SOLUTION >/home/ubuntu/test/main.tf
resource "local_file" "solution" {
  filename = "/home/ubuntu/test/solve.assert"
  content = "ANY\n"
}

SOLUTION

pushd /home/ubuntu/test && {
  sudo solve
}

exit 0
