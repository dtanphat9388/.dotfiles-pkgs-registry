#!/bin/bash

if [[ -f "$DF_CONFIGS/ollama/env.sh" ]]; then
  source "$DF_CONFIGS/ollama/env.sh"
fi

if [[ -f "$DF_HOME/ollama/env.sh" ]]; then
  source "$DF_HOME/ollama/env.sh"
fi
