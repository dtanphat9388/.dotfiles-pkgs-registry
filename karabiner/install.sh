#!/bin/bash

brew install --cask karabiner-elements
if [[ ! -d $DF_CONFIGS/karabiner ]]; then
  cp -r $DF_PACKAGES/karabiner/configs/karabiner $DF_CONFIGS
fi
