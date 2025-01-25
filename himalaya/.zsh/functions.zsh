#!/bin/bash

__home_lib=$1
__home_data=$2

#-- autocomplete
[[ ! -s "$ZSH_COMPLETIONS_DIR/_himalaya" ]] && himalaya completion zsh >$ZSH_COMPLETIONS_DIR/_himalaya && source $ZSH_COMPLETIONS_DIR/_himalaya
