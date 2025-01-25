#!/bin/bash

# description: file analyzer

neofetch_brew() {
  brew install neofetch
}

neofetch_apt() {
  sudo apt install neofetch
}

if [[ $DF_IS_HOMEBREW ]]; then
  neofetch_brew
elif [[ $DF_IS_APT ]]; then
  neofetch_apt
fi
