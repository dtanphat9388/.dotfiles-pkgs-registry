#!/bin/bash

ansible_brew() {
  brew install ansible
}

ansible_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  ansible_brew
elif [[ $DF_IS_APT ]]; then
  ansible_apt
fi
