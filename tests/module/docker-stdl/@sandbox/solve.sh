#!/usr/bin/env bash
docker pull 134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/nginx:latest
sudo tee -a /home/ubuntu/test/solve.assert <<<"ANY"

exit 0
