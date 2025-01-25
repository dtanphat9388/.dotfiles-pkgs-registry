#!/bin/bash

function upgrade_google_chrome() {
  echo upgrading google-chrome
  if [[ $DF_IS_HOMEBREW ]]; then
    echo no command
  elif [[ $DF_IS_APT ]]; then
    upgrade_chrome_apt
  fi
}

install_chrome_brew() {
  brew install --cask --no-quarantine google-chrome
}

install_chrome_apt() {
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome.deb 1>/dev/null
  sudo dpkg -i /tmp/google-chrome.deb 1>/dev/null
}

upgrade_chrome_apt() {
  [[ -x $(command -v google-chrome) ]] && sudo apt-get --only-upgrade install google-chrome-stable
}

echo installing google-chrome
if [[ $DF_IS_MACOS ]]; then
  install_chrome_brew
elif [[ $DF_IS_APT ]]; then
  install_chrome_apt
fi
