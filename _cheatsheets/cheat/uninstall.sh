#!/bin/bash

cheat_brew() {
  brew uninstall cheat
}

cheat_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  cheat_brew
elif [[ $DF_IS_APT ]]; then
  cheat_apt
fi
