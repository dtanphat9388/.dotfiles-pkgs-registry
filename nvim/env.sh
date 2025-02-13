#!/bin/bash

# [[ USER-DEFINED ]]
export VIM_WORKSPACE_STYLE="window" #  window | session
export VIM_WORKSPACE_NAME=$([[ $TERM_PROGRAM == "vscode" ]] && echo "VSCODE" || echo "NVIM")
