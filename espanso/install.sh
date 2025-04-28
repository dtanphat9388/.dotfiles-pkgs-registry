#!/bin/bash

if [[ ! -d $DF_CONFIGS/espanso ]]; then
  mkdir -p $DF_CONFIGS/espanso
  ln -sfn $DF_CONFIGS/espanso $HOME/.config
fi

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
  # create espanso service to auto run on next reboot
  espanso service register
  # start now
  espanso service start
}

if [[ $DF_IS_MACOS ]]; then
  app_brew
elif [[ $DF_IS_LINUX ]]; then
  app_apt
fi
