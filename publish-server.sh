#!/bin/bash
set -e

GIT_HASH=$(git rev-parse HEAD)
echo "using git hash $GIT_HASH"

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker pull gmanthemarioguy/sm64jsarchive-mmo-server || true
docker buildx build --cache-from=gmanthemarioguy/sm64jsarchive-mmo-server -t gmanthemarioguy/sm64jsarchive-mmo-server:latest -f crates/Dockerfile .
docker push gmanthemarioguy/sm64jsarchive-mmo-server:latest
docker tag gmanthemarioguy/sm64jsarchive-mmo-server gmanthemarioguy/sm64jsarchive-mmo-server:$GIT_HASH
docker push gmanthemarioguy/sm64jsarchive-mmo-server:$GIT_HASH
