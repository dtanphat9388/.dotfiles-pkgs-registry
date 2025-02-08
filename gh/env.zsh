#!/bin/bash
#
export GH_DASH_CONFIG=$DF_CONFIGS/gh-dash/config.yaml

if [[ -f "$DF_CONFIGS/example/env.zsh" ]]; then
  source "$DF_CONFIGS/example/env.zsh"
fi

if [[ -f "$DF_HOME/example/env.zsh" ]]; then
  source "$DF_HOME/example/env.zsh"
fi
