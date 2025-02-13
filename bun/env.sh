#!/bin/bash

if [[ -f "$DF_CONFIGS/bun/env.zsh" ]]; then
  source "$DF_CONFIGS/bun/env.zsh"
fi

if [[ -f "$DF_HOME/bun/env.zsh" ]]; then
  source "$DF_HOME/bun/env.zsh"
fi
