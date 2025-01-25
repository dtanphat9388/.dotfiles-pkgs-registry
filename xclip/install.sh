#!/bin/bash

xclip_brew() {
  return
}

xclip_apt() {
  brew install xclip
}

if [[ $DF_IS_MACOS ]]; then
  xclip_brew
elif [[ $DF_IS_APT ]]; then
  xclip_apt
fi
