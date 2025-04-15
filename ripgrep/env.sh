#!/bin/bash

export RIPGREP_CONFIG_PATH="$DF_CONFIGS/ripgrep/.ripgreprc"

if [[ -f "$DF_CONFIGS/ripgrep/env.sh" ]]; then
  source "$DF_CONFIGS/ripgrep/env.sh"
fi

if [[ -f "$DF_HOME/ripgrep/env.sh" ]]; then
  source "$DF_HOME/ripgrep/env.sh"
fi
