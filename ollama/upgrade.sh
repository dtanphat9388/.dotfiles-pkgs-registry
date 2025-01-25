#!/bin/bash

app_brew() {
  brew upgrade ollama
}

app_apt() {
  curl -fsSL https://ollama.com/install.sh | sh
}

if [[ $DF_IS_MACOS ]]; then
  app_brew
elif [[ $DF_IS_LINUX ]]; then
  app_apt
fi
