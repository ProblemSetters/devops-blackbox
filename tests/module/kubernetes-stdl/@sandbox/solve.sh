#!/usr/bin/env bash
kubectl apply -f - <<SOLUTION
apiVersion: v1
kind: Pod
metadata:
  name: test
spec:
  containers:
  - image: 134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/redis:latest
    name: redis
  imagePullSecrets:
    - name: ecr
SOLUTION
sudo tee -a /home/ubuntu/test/solve.assert <<<"ANY"

exit 0
