#!/bin/bash

# description: password manager in CLI
# docs: https://www.zx2c4.com

pass_brew() {
  brew install pass
  brew install pass-otp
}

pass_apt() {
  sudo apt-get install pass
  sudo apt install pass-extension-otp
}

if [[ $DF_IS_HOMEBREW ]]; then
  pass_brew
elif [[ $DF_IS_APT ]]; then
  pass_apt
fi
