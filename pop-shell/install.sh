#!/bin/bash

exa_brew() {
  return
}

exa_apt() {
  local tmp_dir="$(mktemp -d)"
  git clone --depth 1 https://github.com/pop-os/shell
  make local-install
}

if [[ $DF_IS_MACOS ]]; then
  exa_brew
elif [[ $DF_IS_LINUX ]]; then
  exa_apt
fi
