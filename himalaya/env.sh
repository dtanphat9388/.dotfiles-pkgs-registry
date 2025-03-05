#!/bin/bash

if [[ -f "$DF_CONFIGS/himalaya/env.sh" ]]; then
  source "$DF_CONFIGS/himalaya/env.sh"
fi

if [[ -f "$DF_HOME/himalaya/env.sh" ]]; then
  source "$DF_HOME/himalaya/env.sh"
fi
