#!/bin/bash

if [[ $DF_IS_MACOS && $DF_IS_ARCH_INTEL ]]; then
  if [[ ! -L $HOME/.config/espanso ]]; then
    ln -sfn $DF_CONFIGS/espanso "$HOME/Library/Application Support"
  fi
fi

if [[ $DF_IS_LINUX ]]; then
  if [[ ! -L $HOME/.config/espanso ]]; then
    ln -sfn $DF_CONFIGS/espanso $HOME/.config
  fi
fi
