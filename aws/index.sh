#!/bin/bash

__home=$(dirname $0)

action=$1

hook_info() {
  echo your description here
}

hook_check() {
  command -v aws
}

hook_dependencies() {
  echo "brew aws-vault"
}

hook_install() {
  installFile=$__home/install.sh
  [[ -f $installFile ]] && bash $installFile $__home
}

hook_uninstall() {
  uninstallFile=$__home/uninstall.sh
  [[ -f $uninstallFile ]] && bash $uninstallFile $__home
}

hook_link() {
  lnFile=$__home/ln.sh
  [[ -f $lnFile ]] && bash $lnFile $__home
}

hook_env() {
  envFile=$__home/env.sh
  [[ -f $envFile ]] && source $envFile $__home
}

hook_zsh() {
  zshFile=$__home/zsh.sh
  [[ -f $zshFile ]] && source $zshFile $__home
}

if [[ -n $action ]]; then
  eval "hook_$action"
fi
