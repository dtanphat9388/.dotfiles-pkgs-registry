#!/bin/bash

vagrant_brew() {
  brew tap hashicorp/tap
  brew install hashicorp/tap/vagrant
}

vagrant_apt() {
  return
}

echo -- install Vagrant
if [[ $DF_IS_HOMEBREW ]]; then
  vagrant_brew
elif [[ $DF_IS_APT ]]; then
  vagrant_apt
fi
