#!/bin/bash

#-- autocomplete
if [[ ! -s "$ZSH_COMPLETIONS_DIR/_gh" ]]; then
  gh completion -s zsh >$ZSH_COMPLETIONS_DIR/_gh
  source $ZSH_COMPLETIONS_DIR/_gh
fi
