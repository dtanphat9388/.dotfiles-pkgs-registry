#!/bin/bash

__home=$1

export STARSHIP_CONFIG=$(echo $DF_CONFIGS/starship/starship.toml)

[[ -f "$DF_CONFIGS/starship/env.zsh" ]] && source "$DF_CONFIGS/starship/env.zsh"
