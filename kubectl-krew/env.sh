#!/bin/bash

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

if [[ -f "$DF_CONFIGS/kubectl-krew/env.sh" ]]; then
  source "$DF_CONFIGS/kubectl-krew/env.sh"
fi

if [[ -f "$DF_HOME/kubectl-krew/env.sh" ]]; then
  source "$DF_HOME/kubectl-krew/env.sh"
fi
