#!/bin/bash

export TASKRC=$DF_CONFIGS/.taskrc
export TASKDATA=$DF_HOME/task/

if [[ -f "$DF_CONFIGS/taskwarrior/env.zsh" ]]; then
  source "$DF_CONFIGS/taskwarrior/env.zsh"
fi

if [[ -f "$DF_HOME/taskwarrior/env.zsh" ]]; then
  source "$DF_HOME/taskwarrior/env.zsh"
fi
