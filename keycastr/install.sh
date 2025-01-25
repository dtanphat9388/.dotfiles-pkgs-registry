#!/bin/bash

## show key stroke on screen, useful when demo neovim

function install_keycastr() {
  if [[ $DF_IS_MACOS ]]; then
    keycastr_brew
  elif [[ $DF_IS_APT ]]; then
    keycastr_apt
  fi
}

keycastr_brew() {
  brew install --cask keycastr
}

keycastr_apt() {
  # only macos
  return
}
