#!/bin/bash

#-- autocomplete
[[ ! -e "$ZSH_COMPLETIONS_DIR/_fnm" ]] && fnm completions --shell zsh >$ZSH_COMPLETIONS_DIR/_fnm
