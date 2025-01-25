#!/bin/bash

vault_brew() {
  brew install ansible
}

vault_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  vault_brew
elif [[ $DF_IS_APT ]]; then
  vault_apt
fi
