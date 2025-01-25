#!/bin/bash

alacritty_brew_uninstall() {
  return
}

alacritty_apt_uninstall() {
  sudo apt autoremove --purge alacritty
}

if [[ $DF_IS_HOMEBREW ]]; then
  alacritty_brew_uninstall
elif [[ $DF_IS_APT ]]; then
  alacritty_apt_uninstall
fi
