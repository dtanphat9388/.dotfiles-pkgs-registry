#!/bin/bash

devspace_brew() {
  brew install devspace
}

devspace_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  devspace_brew
elif [[ $DF_IS_APT ]]; then
  devspace_apt
fi
