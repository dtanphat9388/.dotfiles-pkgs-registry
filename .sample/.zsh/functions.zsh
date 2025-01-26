#!/bin/bash

__dirname=$1
__home_data=$2

#-- autocomplete
[[ ! -s "$ZSH_COMPLETIONS_DIR/_name" ]] && name completion command >$ZSH_COMPLETIONS_DIR/_name && source $ZSH_COMPLETIONS_DIR/_name
