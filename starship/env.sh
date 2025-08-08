#!/bin/bash

export STARSHIP_CONFIG=$(echo $DF_CONFIGS/starship/starship.toml)

if [[ -f "$DF_CONFIGS/starship/env.sh" ]]; then
  source "$DF_CONFIGS/starship/env.sh"
fi

if [[ -f "$DF_HOME/starship/env.sh" ]]; then
  source "$DF_HOME/starship/env.sh"
fi
