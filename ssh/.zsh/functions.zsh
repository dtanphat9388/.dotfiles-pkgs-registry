#!/bin/bash

#-- aliases

#-- autocomplete

# -- autocomplete with fzf completion
# function _fzf_complete_ssh() {
#   _fzf_complete -- "$@" < <(
#     selected=$(grep -P "^Host ([^*]+)$" $HOME/.ssh/config | sed 's/Host //' | awk '{print $1}')
#     echo $selected
#   )
# }

#-- functions
function sshgc() {
  echo remove ~/.ssh/known_hosts
  rm ~/.ssh/known_hosts
}

sshe() {
  if [[ $DF_IS_TERM_TMUX ]]; then
    vim $HOME/.ssh/config
  else
    code ~/.ssh/config
  fi
}
