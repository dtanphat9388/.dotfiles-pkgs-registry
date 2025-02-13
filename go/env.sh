#!/bin/bash

# commands which installed by go
export PATH=$PATH:$(go env GOPATH)/bin

if [[ -f "$DF_CONFIGS/go/env.zsh" ]]; then
  source "$DF_CONFIGS/go/env.zsh"
fi

if [[ -f "$DF_HOME/go/env.zsh" ]]; then
  source "$DF_HOME/go/env.zsh"
fi
