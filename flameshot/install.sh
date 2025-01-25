#!/bin/bash

app_brew() {
  brew install --cask flameshot
}

app_apt() {
  apt install -y flameshot
  # disable default screenshot shortcut
  gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot '[]'
}

if [[ $DF_IS_MACOS ]]; then
  app_brew
elif [[ $DF_IS_APT ]]; then
  app_apt
fi
