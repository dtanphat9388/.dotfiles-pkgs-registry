#!/bin/bash

__home=$1

# export VIMRUNTIME="$__home/configs"

# [[ USER-DEFINED ]]
export VIM_WORKSPACE_STYLE="window" #  window | session
export VIM_WORKSPACE_NAME=$([[ $TERM_PROGRAM == "vscode" ]] && echo "VSCODE" || echo "NVIM")
