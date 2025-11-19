#!/usr/bin/env bash
cat <<SOLUTION >/home/ubuntu/test/main.tf
provider "aws" {
  region = "eu-central-1"
}

resource "aws_iam_user" "user" {
  name = "Test"
}

resource "local_file" "solution" {
  filename = "/home/ubuntu/test/solve.assert"
  content = "ANY\n"
}

SOLUTION

pushd /home/ubuntu/test && {
  sudo solve
}

exit 0
