#!/bin/bash

__home=$1
__data=$2

export GNUPGHOME=$DF_HOME/gnupg

if [[ -f "$DF_CONFIGS/gnupg/env.zsh" ]]; then
  source "$DF_CONFIGS/gnupg/env.zsh"
fi

if [[ -f "$DF_HOME/gnupg/env.zsh" ]]; then
  source "$DF_HOME/gnupg/env.zsh"
fi
