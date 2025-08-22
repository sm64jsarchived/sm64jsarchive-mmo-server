#!/bin/bash
set -e

GIT_HASH=$(git rev-parse HEAD)
echo "using git hash $GIT_HASH"

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker buildx build -t sm64jsarchive-mmo-server .
docker tag sm64jsarchive gmanthemarioguy/sm64jsarchive-mmo-server:latest
docker push gmanthemarioguy/sm64jsarchive-mmo-server:latest
docker tag sm64jsarchive gmanthemarioguy/sm64jsarchive-mmo-server:$GIT_HASH
docker push gmanthemarioguy/sm64jsarchive-mmo-server:$GIT_HASH
