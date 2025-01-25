#!/bin/bash

# description: process monitoring

htop_brew() {
  brew install htop
}

htop_apt() {
  sudo apt install -y htop
}

if [[ $DF_IS_HOMEBREW ]]; then
  htop_brew
elif [[ $DF_IS_APT ]]; then
  htop_apt
fi
