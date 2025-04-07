#!/bin/bash

if [[ -f "$DF_CONFIGS/aws-vault/env.sh" ]]; then
  source "$DF_CONFIGS/aws-vault/env.sh"
fi

if [[ -f "$DF_HOME/aws-vault/env.sh" ]]; then
  source "$DF_HOME/aws-vault/env.sh"
fi
