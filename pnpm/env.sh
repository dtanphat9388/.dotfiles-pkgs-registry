#!/bin/bash

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

if [[ -f "$DF_CONFIGS/pnpm/env.zsh" ]]; then
  source "$DF_CONFIGS/pnpm/env.zsh"
fi

if [[ -f "$DF_HOME/pnpm/env.zsh" ]]; then
  source "$DF_HOME/pnpm/env.zsh"
fi
