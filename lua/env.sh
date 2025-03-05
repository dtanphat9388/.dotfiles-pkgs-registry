#!/bin/bash

if [[ -f "$DF_CONFIGS/lua/env.sh" ]]; then
  source "$DF_CONFIGS/lua/env.sh"
fi

if [[ -f "$DF_HOME/lua/env.sh" ]]; then
  source "$DF_HOME/lua/env.sh"
fi
