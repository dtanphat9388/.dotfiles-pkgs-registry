#!/bin/bash

kicad_brew_uninstall() {
  return
}

kicad_apt_uninstall() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  kicad_brew_uninstall
elif [[ $DF_IS_APT ]]; then
  kicad_apt_uninstall
fi
