#!/bin/bash
set -e

GIT_HASH=$(git rev-parse HEAD)
echo "using git hash $GIT_HASH"

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker pull gmanthemarioguy/sm64jsarchive || true
docker build --cache-from=gmanthemarioguy/sm64jsarchive -t gmanthemarioguy/sm64jsarchive .
docker push gmanthemarioguy/sm64jsarchive:latest
docker tag gmanthemarioguy/sm64jsarchive gmanthemarioguy/sm64jsarchive:$GIT_HASH
docker push gmanthemarioguy/sm64jsarchive:$GIT_HASH
