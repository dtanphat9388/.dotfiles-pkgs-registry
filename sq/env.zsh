#!/bin/bash

export SQ_CONFIG=$DF_CONFIGS/sq/config

if [[ -f "$DF_CONFIGS/sq/env.zsh" ]]; then
  source "$DF_CONFIGS/sq/env.zsh"
fi
