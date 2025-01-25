#!/usr/bin/bash

forticlient_brew() {
  brew install --cask forticlient
}

forticlient_apt() {
  wget -O - https://repo.fortinet.com/repo/6.4/ubuntu/DEB-GPG-KEY | sudo apt-key add -
  sudo tee /etc/apt/sources.list.d/forticlient.list <<EOF
deb [arch=amd64] https://repo.fortinet.com/repo/7.0/ubuntu/ /bionic multiverse
EOF
  sudo apt update
  sudo apt install forticlient
}

forticlient_apt_uninstall() {
  sudo apt autoremove --purge forticlient
}

if [[ $DF_IS_MACOS ]]; then
  forticlient_brew
elif [[ $DF_IS_APT ]]; then
  forticlient_apt
fi
