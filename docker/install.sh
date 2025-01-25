#!/bin/bash

if [[ $DF_IS_MACOS ]]; then
  brew install --cask docker
else
  curl -fsSL https://get.docker.com -o /tmp/get-docker.sh
  sudo sh /tmp/get-docker.sh
  usermod -aG docker "$(whoami)"
  rm /tmp/get-docker.sh
fi

