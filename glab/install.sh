#!/bin/bash

# description: gitlab cli

glab_brew() {
  brew install glab
}

glab_apt() {
  echo no command
}

if [[ $DF_IS_HOMEBREW ]]; then
  glab_brew
elif [[ $DF_IS_APT ]]; then
  glab_apt
fi
