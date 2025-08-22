#!/bin/bash
set -e

GIT_HASH=$(git rev-parse HEAD)
echo "using git hash $GIT_HASH"

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker buildx build -f crates/Dockerfile -t gmanthemarioguy/sm64jsarchive-mmo-server:latest .
docker tag gmanthemarioguy/sm64jsarchive-mmo-server:latest gmanthemarioguy/sm64jsarchive-mmo-server:$GIT_HASH
docker push gmanthemarioguy/sm64jsarchive-mmo-server:latest
docker push gmanthemarioguy/sm64jsarchive-mmo-server:$GIT_HASH
