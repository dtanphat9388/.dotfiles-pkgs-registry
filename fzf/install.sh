#!/bin/bash

# description: fuzzy finder in cli

fzf_brew() {
  brew install fzf
  /home/linuxbrew/.linuxbrew/opt/fzf/install
}

fzf_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  fzf_brew
elif [[ $DF_IS_APT ]]; then
  fzf_apt
fi
