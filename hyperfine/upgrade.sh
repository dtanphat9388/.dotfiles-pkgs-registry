#!/bin/bash

app_brew() {
  brew update && brew upgrade hyperfine
}

app_apt() {
  apt update hyperfine
}

if [[ $DF_IS_HOMEBREW ]]; then
  app_brew
elif [[ $DF_IS_APT ]]; then
  app_apt
fi
