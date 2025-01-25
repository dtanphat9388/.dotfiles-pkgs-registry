#!/bin/bash

#-- autocomplete
# VAGRANT_VERSION=$(vagrant version | awk -F': ' 'NR==1 {print $2}')
# fpath=("/opt/vagrant/embedded/gems/$VAGRANT_VERSION/gems/vagrant-$VAGRANT_VERSION/contrib/zsh" $fpath)

#-- functions
function vgc() {
  vagrant global-status --prune
  vagrant box prune
}

vls() {
  local query=${1:-""}
  # vagrant global-status | sed '/^\s$/q' | fzf --header-lines=2 -m -q "'$query"
  vagrant global-status | sed '/^\s$/q' | fzf --header-lines=2 \
    --bind 'ctrl-h:execute(vagrant halt {1})+abort' \
    --bind 'ctrl-d:execute(vagrant destroy {1})+abort' \
    --bind 'ctrl-u:execute(vagrant up {1})+abort' \
    --bind 'ctrl-s:execute(vagrant resume {1})+abort' \
    --bind 'ctrl-r:execute(vagrant reload {1})+abort' \
    --bind 'ctrl-m:become(cd {5})+abort'
}
