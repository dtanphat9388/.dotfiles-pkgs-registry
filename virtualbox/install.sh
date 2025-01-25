#!/bin/bash

function virtualbox_brew() {
  brew install --cask virtualbox
}

function virtualbox_apt() {
  sudo apt install -y virtualbox
}

if [[ $DF_IS_MACOS ]]; then
  virtualbox_brew
elif [[ $DF_IS_APT ]]; then
  virtualbox_apt
fi
