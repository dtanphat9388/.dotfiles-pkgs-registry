#!/bin/bash

if [[ -f "$DF_CONFIGS/nix/env.sh" ]]; then
  source "$DF_CONFIGS/nix/env.sh"
fi

if [[ -f "$DF_HOME/nix/env.sh" ]]; then
  source "$DF_HOME/nix/env.sh"
fi
