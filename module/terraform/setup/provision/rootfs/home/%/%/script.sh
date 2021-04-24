#!/usr/bin/env bash
terraform init -backend=false -reconfigure
terraform validate -json
terraform apply -auto-approve -input=false

exit 0
