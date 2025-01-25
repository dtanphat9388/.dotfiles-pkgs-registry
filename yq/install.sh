#!/bin/bash

# description: yaml parser

yq_brew() {
  brew install yq
}

yq_snap() {
  snap install yq
}

if [[ $DF_IS_HOMEBREW ]]; then
  yq_brew
elif [[ $DF_IS_SNAP ]]; then
  yq_snap
fi
