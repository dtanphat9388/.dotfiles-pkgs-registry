#!/bin/bash

# description: k8s dashboard in cli

k9s_brew() {
  brew install derailed/k9s/k9s
}

k9s_apt() {
  echo no command
}

if [[ $DF_IS_HOMEBREW ]]; then
  k9s_brew
elif [[ $DF_IS_APT ]]; then
  k9s_apt
fi
