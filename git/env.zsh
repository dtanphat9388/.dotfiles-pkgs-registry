#!/bin/bash

export GIT_EXEC_PATH=$DF_BIN

if [[ -f "$DF_CONFIGS/git/env.zsh" ]]; then
  source "$DF_CONFIGS/git/env.zsh"
fi
