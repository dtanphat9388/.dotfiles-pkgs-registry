#!/bin/bash

git_brew() {
  brew install git
}

git_apt() {
  sudo apt install -y git
}

if [[ $DF_IS_HOMEBREW ]]; then
  git_brew
elif [[ $DF_IS_APT ]]; then
  git_apt
fi
