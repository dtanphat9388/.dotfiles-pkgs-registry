#!/bin/bash

__dirname=$1
__home_data=$2

#-- autocomplete

if [[ ! -s "$ZSH_COMPLETIONS_DIR/_sq" ]]; then
  sq completion zsh >$ZSH_COMPLETIONS_DIR/_sq
  source $ZSH_COMPLETIONS_DIR/_sq
fi
