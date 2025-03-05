#!/bin/bash

# commands which installed by go
export PATH=$PATH:$(go env GOPATH)/bin

if [[ -f "$DF_CONFIGS/go/env.sh" ]]; then
  source "$DF_CONFIGS/go/env.sh"
fi

if [[ -f "$DF_HOME/go/env.sh" ]]; then
  source "$DF_HOME/go/env.sh"
fi
