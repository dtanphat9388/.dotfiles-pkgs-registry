#!/bin/bash

bat_brew() {
  brew install bat
}

bat_apt() {
  sudo apt install bat
}

if [[ $DF_IS_HOMEBREW ]]; then
  bat_brew
elif [[ $DF_IS_APT ]]; then
  bat_apt
fi
