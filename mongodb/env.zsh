#!/bin/bash

if [[ -f "$DF_CONFIGS/mongodb/env.zsh" ]]; then
  source "$DF_CONFIGS/mongodb/env.zsh"
fi

if [[ -f "$DF_HOME/mongodb/env.zsh" ]]; then
  source "$DF_HOME/mongodb/env.zsh"
fi
