#!/bin/bash

if [[ -f "$DF_CONFIGS/taskwarrior/env.sh" ]]; then
  source "$DF_CONFIGS/taskwarrior/env.sh"
fi

if [[ -f "$DF_HOME/taskwarrior/env.sh" ]]; then
  source "$DF_HOME/taskwarrior/env.sh"
fi
