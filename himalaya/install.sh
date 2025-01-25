#!/bin/bash

app_brew() {
  brew install himalaya
}

app_apt() {
  echo "not available"
}

if [[ $DF_IS_HOMEBREW ]]; then
  app_brew
elif [[ $DF_IS_APT ]]; then
  app_apt
fi
