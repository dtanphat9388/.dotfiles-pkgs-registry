#!/bin/bash

app_brew() {
  brew install hyperfine
}

app_apt() {
  apt install hyperfine
}

if [[ $DF_IS_HOMEBREW ]]; then
  app_brew
elif [[ $DF_IS_APT ]]; then
  app_apt
fi
