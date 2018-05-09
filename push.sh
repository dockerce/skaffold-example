#!/bin/bash

set -e

# Login DockerHub
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

cd /opt/skaffold

tags=$(git tag)

# latest
docker push dockerce/skaffold-example:latest

# legacy
for tag in ${tags[@]}; do
  docker push dockerce/skaffold-example:$tag
done