#!/bin/bash

if [[ -f "$DF_CONFIGS/lua/env.zsh" ]]; then
  source "$DF_CONFIGS/lua/env.zsh"
fi

if [[ -f "$DF_HOME/lua/env.zsh" ]]; then
  source "$DF_HOME/lua/env.zsh"
fi
