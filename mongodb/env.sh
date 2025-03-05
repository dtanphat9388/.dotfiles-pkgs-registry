#!/bin/bash

if [[ -f "$DF_CONFIGS/mongodb/env.sh" ]]; then
  source "$DF_CONFIGS/mongodb/env.sh"
fi

if [[ -f "$DF_HOME/mongodb/env.sh" ]]; then
  source "$DF_HOME/mongodb/env.sh"
fi
