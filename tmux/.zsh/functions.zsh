#!/bin/bash

__dirname=$1
__home_data=$2

source $__dirname/.zsh/helpers.sh

# -- create new tmux session
function tmnew() {
  name=$1
  tmux new-session -d -s $name
  tmux switch-client -t $name
}

tme() {
  vim $__home_tmux
}

tmk() {
  eval "tmux kill-session -t '#{${1:-session_name}}'"
}

tmns() {
  selected=$(tmux list-sessions -F '#S' | fzf)
  tmux switch-client -t $selected
}
