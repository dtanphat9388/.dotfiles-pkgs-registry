#!/bin/bash

export FZF_BASE="$HOME/.fzf"

if [[ $(command -v fd) ]]; then
  export FZF_CTRL_T_COMMAND='fd --type d --strip-cwd-prefix'
fi

if [[ -f "$DF_CONFIGS/fzf/env.sh" ]]; then
  source "$DF_CONFIGS/fzf/env.sh"
fi

if [[ -f "$DF_HOME/fzf/env.sh" ]]; then
  source "$DF_HOME/fzf/env.sh"
fi
