#!/bin/bash
set -e

GIT_HASH=$(git rev-parse HEAD)
echo "using git hash $GIT_HASH"

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker buildx build -t sm64jsarchive .
docker tag sm64jsarchive gmanthemarioguy/sm64jsarchive:latest
docker push gmanthemarioguy/sm64jsarchive:latest
docker tag sm64jsarchive gmanthemarioguy/sm64jsarchive:$GIT_HASH
docker push gmanthemarioguy/sm64jsarchive:$GIT_HASH
