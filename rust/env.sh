#!/bin/bash

# load rust PATH
. "$HOME/.cargo/env"

if [[ -f "$DF_CONFIGS/rust/env.zsh" ]]; then
  source "$DF_CONFIGS/rust/env.zsh"
fi

if [[ -f "$DF_HOME/rust/env.zsh" ]]; then
  source "$DF_HOME/rust/env.zsh"
fi
