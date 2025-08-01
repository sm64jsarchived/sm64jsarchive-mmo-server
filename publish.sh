#!/bin/bash
set -e

GIT_HASH=$(git rev-parse HEAD)
echo "using git hash $GIT_HASH"

docker login

docker buildx build -t sm64jsarchive .
docker tag sm64jsarchive gmanthemarioguy/sm64jsarchive:latest
docker push gmanthemarioguy/sm64jsarchive:latest
docker tag sm64jsarchive gmanthemarioguy/sm64jsarchive:$GIT_HASH
docker push gmanthemarioguy/sm64jsarchive:$GIT_HASH
