#!/bin/bash

__home=$1

# -- rare change --

# -- change aws config location
export AWS_CONFIG_FILE="$DF_HOME/.aws/config"
export AWS_SHARED_CREDENTIALS_FILE="$DF_HOME/.aws/credentials"

# -- Enables the auto-prompt for the AWS CLI version 2.
# -- values: on | on-partial
# export AWS_CLI_AUTO_PROMPT=on

# -- disable output pagination
export AWS_PAGER=

if [[ -f "$DF_CONFIGS/aws/env.sh" ]]; then
  source "$DF_CONFIGS/aws/env.sh"
fi

if [[ -f "$DF_HOME/aws/env.sh" ]]; then
  source "$DF_HOME/aws/env.sh"
fi
