#!/bin/bash

CONTAINER_NAME="$(basename $(pwd))"

# d e e p = 4 5 5 16
PORT=45516

while (true); do
  docker run -it --rm \
    --name $CONTAINER_NAME \
    -p $PORT:80 \
    deepwiki ./start.sh
  echo "restarting docker container in 2 seconds"
  sleep 2
done

