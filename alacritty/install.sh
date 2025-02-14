#!/bin/bash

__dirname=$(dirname "$0")

if [[ $DF_IS_MACOS ]]; then
  brew install --cask --no-quarantine alacritty
elif [[ $DF_IS_LINUX ]]; then
  sudo add-apt-repository ppa:aslatter/ppa
  sudo apt update -y
  sudo apt install -y alacritty
  #-- set alacrity as default terminal
  sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 50
  sudo update-alternatives --set x-terminal-emulator
fi

. "$__dirname/ln.sh"
