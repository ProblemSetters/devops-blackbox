#!/usr/bin/env bash
cat <<SOLUTION >/home/ubuntu/test/script.sh
#!/usr/bin/env bash
kubectl apply -f definition.yml
sudo tee -a /home/ubuntu/test/solve.assert <<<"ANY"

exit 0
SOLUTION

cat <<SOLUTION >/home/ubuntu/test/definition.yml
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

exit 0
