#!/bin/bash

# description: fuzzy finder in cli

brew install fzf
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh) >$ZSH_COMPLETIONS_DIR/_fzf
source $ZSH_COMPLETIONS_DIR/_fzf
/home/linuxbrew/.linuxbrew/opt/fzf/install
