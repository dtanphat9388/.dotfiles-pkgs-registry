#!/bin/bash

# description: Hack nerd font

font_brew() {
  brew tap homebrew/cask-fonts/font-hack
  brew tap homebrew/cask-fonts
  brew install --cask font-hack
}

font_apt() {
  sudo apt install -y fonts-hack-ttf
}

if [[ $DF_IS_MACOS ]]; then
  font_brew
elif [[ $DF_IS_LINUX ]]; then
  font_apt
fi
