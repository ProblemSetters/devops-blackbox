#!/usr/bin/env bash
cat <<SOLUTION >/home/ubuntu/test/script.sh
#!/usr/bin/env bash
docker buildx build --no-cache --progress=plain -t test - </home/ubuntu/test/Dockerfile
sudo tee -a /home/ubuntu/test/solve.assert <<<"ANY"

exit 0
SOLUTION

cat <<SOLUTION >/home/ubuntu/test/Dockerfile
FROM 134148934511.dkr.ecr.us-east-1.amazonaws.com/hr/nginx:latest
SOLUTION

pushd /home/ubuntu/test && {
  solve
}

exit 0
