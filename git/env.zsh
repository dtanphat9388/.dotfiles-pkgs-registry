#!/bin/bash

if [[ $EDITOR == "code" ]]; then
  export GIT_CONFIG_GLOBAL=$DF_CONFIGS/git/.gitconfig-vscode
elif [[ $EDITOR == "nvim" ]]; then
  export GIT_CONFIG_GLOBAL=$DF_CONFIGS/git/.gitconfig-nvim
fi
