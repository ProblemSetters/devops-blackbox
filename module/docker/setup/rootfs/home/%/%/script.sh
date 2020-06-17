#!/usr/bin/env bash
docker run -di --name example-container alpine
docker exec -i example-container echo "Good luck! :)"

exit 0
