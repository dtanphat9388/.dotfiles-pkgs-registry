#!/bin/bash

export FZF_BASE="$HOME/.fzf"

if [[ $(command -v fd) ]]; then
  export FZF_CTRL_T_COMMAND='fd --type d --strip-cwd-prefix'
fi

source "$DF_CONFIGS/fzf/env.zsh"
