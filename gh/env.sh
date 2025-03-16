#!/bin/bash

export GH_DASH_CONFIG=$DF_CONFIGS/gh-dash/config.yaml

if [[ -f "$DF_CONFIGS/gh/env.sh" ]]; then
  source "$DF_CONFIGS/gh/env.sh"
fi

if [[ -f "$DF_HOME/gh/env.sh" ]]; then
  source "$DF_HOME/gh/env.sh"
fi
