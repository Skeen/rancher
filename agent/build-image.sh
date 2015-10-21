#!/bin/bash

ARCH=$(uname -m)
DOCKERFILE=Dockerfile-$ARCH

cd $(dirname $0)

if [ -z "$TAG" ]; then
    TAG=$(grep RANCHER_AGENT_IMAGE $DOCKERFILE | cut -f2 -d:)
    TAG=$(echo ":$TAG-$ARCH")
fi

IMAGE=rancher/agent${TAG}

echo Building $IMAGE
docker build -t ${IMAGE} -f $DOCKERFILE .
