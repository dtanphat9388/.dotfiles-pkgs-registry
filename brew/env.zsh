#!/bin/bash

[[ $DF_IS_LINUX ]] && export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"

# apple silicon
[[ $DF_IS_ARCH_ARM ]] && export PATH="$PATH:/opt/homebrew"

# apple intel
[[ $DF_IS_MACOS ]] && export PATH="$PATH:/usr/local"

if [[ -f "$DF_CONFIGS/brew/env.zsh" ]]; then
  source "$DF_CONFIGS/brew/env.zsh"
fi

if [[ -f "$DF_HOME/brew/env.zsh" ]]; then
  source "$DF_HOME/brew/env.zsh"
fi
