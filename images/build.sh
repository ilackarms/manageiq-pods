#!/usr/bin/env bash

export BASE_IMAGE="miq-app-base"
export FINAL_IMAGE="docker.io/ilackarms/miq-app-frontend:latest"

pushd miq-app
docker build -t ${BASE_IMAGE} --no-cache .
popd

pushd miq-app-frontend
cat Dockerfile.base | sed "s/FROM BASE_IMAGE/FROM ${BASE_IMAGE}/g" > Dockerfile
docker build -t ${FINAL_IMAGE} .
popd