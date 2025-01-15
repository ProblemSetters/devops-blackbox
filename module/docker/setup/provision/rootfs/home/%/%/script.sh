#!/usr/bin/env bash
docker run -di --name example-container public.ecr.aws/docker/library/alpine
docker exec -i example-container echo "Good luck! :)"

exit 0
