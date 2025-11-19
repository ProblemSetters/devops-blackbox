#!/usr/bin/env bash
sudo microceph enable rgw
sudo radosgw-admin user create --uid=client --display-name=client
sudo radosgw-admin key create --uid=client --key-type=s3 --access-key="$AWS_ACCESS_KEY_ID" --secret-key="$AWS_SECRET_ACCESS_KEY"
aws --endpoint="http://127.0.0.1" s3 mb s3://storage
aws --endpoint="http://127.0.0.1" s3 cp --recursive /tmp/test s3://storage
sudo tee -a /home/ubuntu/test/solve.assert <<<"ANY"

exit 0
