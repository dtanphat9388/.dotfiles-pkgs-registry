#!/bin/bash

if [[ -f "$DF_CONFIGS/ssh/env.sh" ]]; then
  source "$DF_CONFIGS/ssh/env.sh"
fi

if [[ -f "$DF_HOME/ssh/env.sh" ]]; then
  source "$DF_HOME/ssh/env.sh"
fi
