#!/bin/bash

docker info && docker version
mkdir -p ~/docker

# cache some Docker images to make builds faster
if [[ -e ~/docker/centos.tar ]]; then
  docker load -i ~/docker/centos.tar;
else
  docker build --tag "iconremote/buildcontainer" docker/buildcontainer
  docker save iconremote/buildcontainer > ~/docker/centos.tar;
fi


