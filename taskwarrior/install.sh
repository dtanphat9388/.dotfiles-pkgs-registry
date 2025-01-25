#!/bin/bash

app_brew() {
  brew install task
  brew install taskwarrior-tui
}

app_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  app_brew
elif [[ $DF_IS_APT ]]; then
  app_apt
fi
