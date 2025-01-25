#!/bin/bash

gns3_brew() {
  return
}

function gns3_apt() {
  sudo add-apt-repository ppa:gns3/ppa
  sudo apt update -y
  sudo apt install gns3-gui gns3-server

  sudo dpkg --add-architecture i386
  sudo apt update -y
  sudo apt install gns3-iou

  sudo chmod 755 /usr/bin/ubridge
  sudo ubridge libvirt kvm wireshark docker
}

if [[ $DF_IS_HOMEBREW ]]; then
  gns3_brew
elif [[ $DF_IS_APT ]]; then
  gns3_apt
fi
