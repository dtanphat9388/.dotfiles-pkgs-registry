#!/bin/bash

# -- ALIASES

# alias k="v"

# -- COMPLETIONS

# if [[ ! -s "$ZSH_COMPLETIONS_DIR/_example" ]]; then
#   example completions zsh >$ZSH_COMPLETIONS_DIR/_example
#   source $ZSH_COMPLETIONS_DIR/_example
# fi

# -- FUNCTIONS
gitgc() {
  git gc --prune=now
  git remote prune origin
  git clean -xdf
  git branch -D $(git branch --merged)
}
