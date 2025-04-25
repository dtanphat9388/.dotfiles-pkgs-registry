#!/bin/bash

if [[ -f "$DF_CONFIGS/example/env.sh" ]]; then
  source "$DF_CONFIGS/example/env.sh"
fi

if [[ -f "$DF_HOME/example/env.sh" ]]; then
  source "$DF_HOME/example/env.sh"
fi
