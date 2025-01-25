#!/bin/bash

app_brew() {
	brew install gawk
	brew install espeak
	brew install translate-shell
}

app_apt() {
	sudo apt install translate-shell
}

if [[ $DF_IS_HOMEBREW ]]; then
	app_brew
elif [[ $DF_IS_APT ]]; then
	app_apt
fi
