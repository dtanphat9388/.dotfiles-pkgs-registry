#!/bin/bash

__home=$1

#-- personal cheatsheets
export CHEAT_CONFIG_PATH="$__home/configs/conf.yml"

# cheat supports enhanced autocompletion via integration with fzf
export CHEAT_USE_FZF=true

if [[ -f "$DF_CONFIGS/asdf/env.zsh" ]]; then
  source "$DF_CONFIGS/asdf/env.zsh"
fi

if [[ -f "$DF_HOME/asdf/env.zsh" ]]; then
  source "$DF_HOME/asdf/env.zsh"
fi
