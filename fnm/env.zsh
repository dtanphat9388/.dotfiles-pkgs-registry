#!/bin/bash

__home=$1
__data=$2

if [[ $DF_IS_MACOS ]]; then
  export PATH="/usr/local/bin/fnm:$PATH"
else
  export PATH="$HOME/.local/share/fnm:$PATH"
fi

[[ -f "$DF_CONFIGS/fnm/env.zsh" ]] && source "$DF_CONFIGS/fnm/env.zsh"
