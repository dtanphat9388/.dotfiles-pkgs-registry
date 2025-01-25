#!/bin/bash

openvpn_brew() {
    brew install --cask tunnelblick
}

openvpn_apt() {
    {
        DISTRO=$(lsb_release -cs)
        sudo apt-get install -y apt-transport-https
        sudo wget https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub
        sudo apt-key add openvpn-repo-pkg-key.pub
        sudo wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-$DISTRO.list
        sudo apt update -y
        sudo apt install -y openvpn3
    } 1>/dev/null
}

if [[ $DF_IS_MACOS ]]; then
    openvpn_brew
elif [[ $DF_IS_APT ]]; then
    openvpn_apt
fi
