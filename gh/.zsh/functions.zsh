#!/bin/bash

__home_lib=$1
__home_data=$2

#-- autocomplete
[[ ! -s "$ZSH_COMPLETIONS_DIR/_gh" ]] && gh completion -s zsh >$ZSH_COMPLETIONS_DIR/_gh
