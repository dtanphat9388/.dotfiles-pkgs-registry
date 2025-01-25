#!/bin/bash

alacritty_brew() {
  brew install --cask --no-quarantine alacritty
}

alacritty_apt() {
  sudo add-apt-repository ppa:aslatter/ppa
  sudo apt update -y
  sudo apt install -y alacritty
  #-- set alacrity as default terminal
  sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/alacritty 50
  sudo update-alternatives --config x-terminal-emulator
}

if [[ $DF_IS_MACOS ]]; then
  alacritty_brew
elif [[ $DF_IS_APT ]]; then
  alacritty_apt
fi
