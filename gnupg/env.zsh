#!/bin/bash

__home=$1
__data=$2

export GNUPGHOME=$DF_HOME/gnupg

[[ -f "$DF_CONFIGS/gnupg/env.zsh" ]] && source "$DF_CONFIGS/gnupg/env.zsh"
