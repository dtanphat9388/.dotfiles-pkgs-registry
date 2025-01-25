#!/bin/bash

kicad_brew() {
	brew install --cask kicad
}

kicad_apt() {
	sudo add-apt-repository --yes ppa:kicad/kicad-8.0-releases
	sudo apt update
	sudo apt install --install-recommends kicad
}

if [[ $DF_IS_MACOS ]]; then
	kicad_brew
elif [[ $DF_IS_LINUX ]]; then
	kicad_apt
fi
