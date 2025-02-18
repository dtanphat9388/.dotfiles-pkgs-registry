#!/bin/bash

__home=$(dirname $0)
__data="$DF_HOME"

action=$1

hook_info() {
  echo package manager for almost libs: kubectl, node, ....
}

hook_check() {
  command -v asdf
}

hook_dependencies() {
  echo "brew"
}

hook_install() {
  installFile=$__home/install.sh
  [[ -f $installFile ]] && bash $installFile $__home
}

hook_uninstall() {
  uninstallFile=$__home/uninstall.sh
  [[ -f $uninstallFile ]] && bash $uninstallFile $__home
}

hook_upgrade() {
  upgradeFile=$__home/upgrade.sh
  [[ -f $upgradeFile ]] && bash $upgradeFile
}

hook_link() {
  lnFile=$__home/ln.sh
  [[ -f $lnFile ]] && bash $lnFile $__home $__data
}

hook_env() {
  envFile=$__home/env.sh
  [[ -f $envFile ]] && source "$envFile"
}

hook_zsh() {
  return # remove return if have zsh files
  # note: place by order
  source $__home/.zsh/aliases.zsh
  source $__home/.zsh/functions.zsh
}

if [[ $action == "check" ]]; then
  hook_check
elif [[ $action == "install" ]]; then
  hook_install
elif [[ $action == "uninstall" ]]; then
  hook_uninstall
elif [[ $action == "upgrade" ]]; then
  hook_upgrade
elif [[ $action == "link" ]]; then
  hook_link
elif [[ $action == "env" ]]; then
  hook_env
elif [[ $action == "zsh" ]]; then
  hook_zsh
elif [[ $action == "info" ]]; then
  hook_info
fi
