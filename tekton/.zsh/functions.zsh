#!/bin/bash

#-- autocomplete
[[ ! -s "$ZSH_COMPLETIONS_DIR/_tekton" ]] && tkn completion zsh > $ZSH_COMPLETIONS_DIR/_tekton

#-- functions
