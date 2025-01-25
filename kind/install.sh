#!/bin/bash

kind_brew() {
  brew install kind
}

kind_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  kind_brew
elif [[ $DF_IS_APT ]]; then
  kind_apt
fi
