#!/bin/bash

kicad_brew() {
  return
}

kicad_apt() {
  sudo add-apt-repository ppa:kicad/kicad-7.0-releases
  sudo apt update
  sudo apt install kicad --fix-missing
}

if [[ $DF_IS_MACOS ]]; then
  kicad_brew
elif [[ $DF_IS_APT ]]; then
  kicad_apt
fi
