#!/bin/bash

app_brew_uninstall() {
  return
}

app_apt_uninstall() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  app_brew_uninstall
elif [[ $DF_IS_APT ]]; then
  app_apt_uninstall
fi
