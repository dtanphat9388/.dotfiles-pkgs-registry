#!/bin/bash

# description: tekton CD

tekton_brew() {
  brew install tektoncd-cli
}

tekton_apt() {
  sudo apt update
  sudo apt install -y gnupg
  sudo mkdir -p /etc/apt/keyrings/
  sudo gpg --no-default-keyring --keyring /etc/apt/keyrings/tektoncd.gpg --keyserver keyserver.ubuntu.com --recv-keys 2EFE0E0A2F2F60AA
  echo "deb [signed-by=/etc/apt/keyrings/tektoncd.gpg] http://ppa.launchpad.net/tektoncd/cli/ubuntu eoan main" | sudo tee /etc/apt/sources.list.d/tektoncd-ubuntu-cli.list
  sudo apt update && sudo apt install -y tektoncd-cli
}

if [[ $DF_IS_HOMEBREW ]]; then
  tekton_brew
elif [[ $DF_IS_APT ]]; then
  tekton_apt
fi
