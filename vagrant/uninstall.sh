#!/bin/bash

vagrant_brew_uninstall() {
  sudo rm -rf /opt/vagrant /usr/local/bin/vagrant
  sudo pkgutil --forget com.vagrant.vagrant
}

vagrant_apt_uninstall() {
  sudo apt remove vagrant
  rm -rf /opt/vagrant
  rm -f /usr/bin/vagrant
}

if [[ $DF_IS_HOMEBREW ]]; then
  vagrant_brew_uninstall
elif [[ $DF_IS_APT ]]; then
  vagrant_apt_uninstall
fi
