#!/bin/bash

# description: replace build-in fd command

app_brew() {
  brew install jinja2-cli
}

app_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  app_brew
elif [[ $DF_IS_APT ]]; then
  app_apt
fi
