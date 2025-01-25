#!/bin/bash

app_brew() {
  brew install --cask obsidian
}

app_snap() {
  sudo snap install obsidian --classic
}

if [[ $DF_IS_MACOS ]]; then
  app_brew
elif [[ $DF_IS_SNAP ]]; then
  app_snap
fi
