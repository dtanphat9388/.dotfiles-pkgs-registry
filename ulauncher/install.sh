#!/bin/bash

ulauncher_brew() {
  return
}

ulauncher_apt() {
  echo -- setup ulauncher as spotlight in macos
  sudo add-apt-repository -y ppa:agornostal/ulauncher
  sudo apt update -y
  sudo apt install -y ulauncher
}

if [[ $DF_IS_HOMEBREW ]]; then
  ulauncher_brew
elif [[ $DF_IS_APT ]]; then
  ulauncher_apt
fi
