#!/bin/bash

export FZF_BASE="$HOME/.fzf"

if [[ $(command -v fd) ]]; then
  export FZF_CTRL_T_COMMAND='fd --type d --strip-cwd-prefix'
fi

if [[ -f "$DF_CONFIGS/fzf/env.zsh" ]]; then
  source "$DF_CONFIGS/fzf/env.zsh"
fi

if [[ -f "$DF_HOME/fzf/env.zsh" ]]; then
  source "$DF_HOME/fzf/env.zsh"
fi
