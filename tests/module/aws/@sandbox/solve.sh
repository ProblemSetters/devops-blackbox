#!/usr/bin/env bash
{
  shopt -os allexport
  . /etc/environment
  shopt -ou allexport
}

aws ec2 create-key-pair --key-name test --no-cli-pager
aws ec2 run-instances --image-id "$(aws ec2 describe-images --filters 'Name=description,Values=*Ubuntu*16.04 LTS*' --query 'Images[].ImageId' --output text)" --instance-type t3.nano --key-name test --no-cli-pager
sudo tee -a /home/ubuntu/test/solve.assert <<<"ANY"

exit 0
