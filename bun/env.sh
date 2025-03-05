#!/bin/bash

if [[ -f "$DF_CONFIGS/bun/env.sh" ]]; then
  source "$DF_CONFIGS/bun/env.sh"
fi

if [[ -f "$DF_HOME/bun/env.sh" ]]; then
  source "$DF_HOME/bun/env.sh"
fi
