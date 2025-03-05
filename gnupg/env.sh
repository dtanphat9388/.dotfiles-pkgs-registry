#!/bin/bash

__home=$1
__data=$2

export GNUPGHOME=$DF_HOME/gnupg

if [[ -f "$DF_CONFIGS/gnupg/env.sh" ]]; then
  source "$DF_CONFIGS/gnupg/env.sh"
fi

if [[ -f "$DF_HOME/gnupg/env.sh" ]]; then
  source "$DF_HOME/gnupg/env.sh"
fi
