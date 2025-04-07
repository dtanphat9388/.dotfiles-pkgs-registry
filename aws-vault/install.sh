#!/bin/bash

if [[ $DF_IS_MACOS ]]; then
  brew install --cask aws-vault
elif [[ $DF_IS_LINUX ]]; then
  brew install aws-vault
fi
