#!/bin/bash

__home=$(dirname $0)

action=$1

hook_check() {
  command -v az
}

hook_dependencies() {
  echo "brew"
}

hook_install() {
  installFile=$__home/install.sh
  [[ -f $installFile ]] && source $installFile
}

hook_link() {
  lnFile=$__home/ln.sh
  [[ -f $lnFile ]] && source $lnFile
}

hook_zsh() {
  return
  source $__home/setup/path.zsh
  source $__home/.zsh/aliases.zsh
  source $__home/env.zsh
  source $__home/.zsh/functions.zsh
}

if [[ $action == "check" ]]; then
  hook_check
elif [[ $action == "install" ]]; then
  hook_install
elif [[ $action == "link" ]]; then
  hook_link
elif [[ $action == "zsh" ]]; then
  hook_zsh
fi
