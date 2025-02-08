#!/bin/bash

if [[ -f "$DF_CONFIGS/ssh/env.zsh" ]]; then
  source "$DF_CONFIGS/ssh/env.zsh"
fi

if [[ -f "$DF_HOME/ssh/env.zsh" ]]; then
  source "$DF_HOME/ssh/env.zsh"
fi
