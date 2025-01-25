#!/bin/bash

# description: keyboard remaper for linux

keyd_brew() {
  return
}

keyd_apt() {
  local clonefolder=/tmp/keyd
  git clone https://github.com/rvaiya/keyd $clonefolder
  cd $clonefolder
  make && sudo make install
  sudo systemctl enable keyd && sudo systemctl start keyd
}

if [[ $DF_IS_MACOS ]]; then
  keyd_brew
elif [[ $DF_IS_LINUX ]]; then
  keyd_apt
fi
