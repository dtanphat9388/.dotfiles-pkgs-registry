#!/bin/bash

if [[ -f "$DF_CONFIGS/aws/env.sh" ]]; then
  source "$DF_CONFIGS/aws/env.sh"
fi

if [[ -f "$DF_HOME/aws/env.sh" ]]; then
  source "$DF_HOME/aws/env.sh"
fi
