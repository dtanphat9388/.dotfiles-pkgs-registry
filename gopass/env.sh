#!/bin/bash

if [[ -f "$DF_CONFIGS/gopass/env.sh" ]]; then
  source "$DF_CONFIGS/gopass/env.sh"
fi

if [[ -f "$DF_HOME/gopass/env.sh" ]]; then
  source "$DF_HOME/gopass/env.sh"
fi
