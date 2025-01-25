#!/bin/bash

# description: file analyzer

gdu_brew() {
  brew install gdu
}

gdu_apt() {
  sudo apt install -y gdu
}

if [[ $DF_IS_HOMEBREW ]]; then
  gdu_brew
elif [[ $DF_IS_APT ]]; then
  gdu_apt
fi
