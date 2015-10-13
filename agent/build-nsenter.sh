#!/bin/bash

docker build -f Dockerfile-nsenter-builder --tag=nsenter-builder:latest .
docker run --name nsenter-cp -it -d nsenter-builder:latest
docker cp nsenter-cp:/util-linux/nsenter util-linux
docker stop nsenter-cp
docker rm nsenter-cp
