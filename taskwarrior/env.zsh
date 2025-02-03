#!/bin/bash

__home=$1
__data=$2

# export key=value
export TASKRC=$DF_CONFIGS/.taskrc
export TASKDATA=$DF_HOME/task/

[[ -f "$DF_CONFIGS/taskwarrior/env.zsh" ]] && source "$DF_CONFIGS/taskwarrior/env.zsh"
