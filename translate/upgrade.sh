#!/bin/bash

app_brew() {
  brew upgrade gawk
  brew upgrade espeak
  brew upgrade translate-shell
}

app_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  app_brew
elif [[ $DF_IS_APT ]]; then
  app_apt
fi
