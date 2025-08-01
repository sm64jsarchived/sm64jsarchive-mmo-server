#!/bin/bash
set -e

docker buildx build -t sm64jsarchive-mmo-server -f ./crates/Dockerfile .
