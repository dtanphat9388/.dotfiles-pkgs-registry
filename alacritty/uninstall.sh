#!/bin/bash

if [[ $DF_IS_MACOS ]]; then
  brew uninstall --cask alacritty
elif [[ $DF_IS_LINUX ]]; then
  sudo apt autoremove --purge alacritty
fi
