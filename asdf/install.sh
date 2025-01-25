#!/bin/bash

asdf_brew() {
  brew install asdf
}

asdf_apt() {
  # no command
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  asdf_brew
elif [[ $DF_IS_APT ]]; then
  asdf_apt
fi

if [[ $(command -v asdf) ]]; then
  asdf plugin add kubectl https://github.com/asdf-community/asdf-kubectl.git
fi
