#!/bin/bash

if [[ -f "$DF_CONFIGS/espanso/env.sh" ]]; then
  source "$DF_CONFIGS/espanso/env.sh"
fi

if [[ -f "$DF_HOME/espanso/env.sh" ]]; then
  source "$DF_HOME/espanso/env.sh"
fi
