#!/bin/bash

export SQ_CONFIG=$DF_CONFIGS/sq/config
if [[ ! -f "$SQ_CONFIG" ]]; then
  touch "$SQ_CONFIG"
fi

[[ -f "$DF_CONFIGS/sq/env.zsh" ]] && source "$DF_CONFIGS/sq/env.zsh"
