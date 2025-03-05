#!/bin/bash

export TASKRC=$DF_CONFIGS/.taskrc
export TASKDATA=$DF_HOME/task/

if [[ -f "$DF_CONFIGS/taskwarrior/env.sh" ]]; then
  source "$DF_CONFIGS/taskwarrior/env.sh"
fi

if [[ -f "$DF_HOME/taskwarrior/env.sh" ]]; then
  source "$DF_HOME/taskwarrior/env.sh"
fi
