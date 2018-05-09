#!/bin/bash

set -e

git clone https://github.com/GoogleContainerTools/skaffold /opt/skaffold

cd /opt/skaffold/examples/getting-started

tags=$(git tag)

# latest (master branch)
docker build -f Dockerfile -t dockerce/skaffold-example:latest .

# legacy
for tag in ${tags[@]}; do
  git checkout tags/$tag -b $tag
  docker build -f Dockerfile -t dockerce/skaffold-example:$tag .
done