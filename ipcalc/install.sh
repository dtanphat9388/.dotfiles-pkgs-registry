#!/bin/bash

# -- IP calc
if [[ $DF_IS_HOMEBREW ]]; then
  brew install ipcalc
elif [[ $DF_IS_APT ]]; then
  sudo apt install ipcalc
fi
