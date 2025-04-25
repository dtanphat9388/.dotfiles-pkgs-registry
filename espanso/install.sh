#!/bin/bash

app_brew() {
  if [[ $DF_IS_ARCH_INTEL ]]; then
    brew install espanso
  fi
}

app_apt() {
  # Create the $HOME/opt destination folder
  mkdir -p ~/opt
  # Download the AppImage inside it
  wget -O ~/opt/Espanso.AppImage 'https://github.com/espanso/espanso/releases/download/v2.2.1/Espanso-X11.AppImage'
  # Make it executable
  chmod u+x ~/opt/Espanso.AppImage
  # Create the "espanso" command alias
  sudo ~/opt/Espanso.AppImage env-path register
  espanso service register
}

if [[ $DF_IS_MACOS ]]; then
  app_brew
elif [[ $DF_IS_LINUX ]]; then
  app_apt
fi
