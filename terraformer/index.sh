#!/bin/bash

__home_lib=$(dirname $0)
__home_data="$DF_HOME"

action=$1

hook_info() {
  echo IaC tool to import configs from exist infrastructure
}

hook_check() {
  command -v terraformer
}

hook_install() {
  installFile=$__home_lib/install.sh
  [[ -f $installFile ]] && bash "$installFile" "$__home_lib"
}

hook_uninstall() {
  uninstallFile=$__home_lib/uninstall.sh
  [[ -f $uninstallFile ]] && bash "$uninstallFile" "$__home_lib"
}

hook_upgrade() {
  upgradeFile=$__home_lib/upgrade.sh
  [[ -f $upgradeFile ]] && bash "$upgradeFile"
}

hook_link() {
  lnFile=$__home_lib/ln.sh
  [[ -f $lnFile ]] && bash "$lnFile" "$__home_lib" "$__home_data"
}

hook_env() {
  envFile=$__home_lib/env.zsh
  [[ -f $envFile ]] && source "$envFile" "$__home_lib" "$__home_data"
}

hook_zsh() {
  [[ -f "$__home/.zsh/aliases.zsh" ]] && source "$__home/.zsh/aliases.zsh" "$__home" "$__data"
  [[ -f "$__home/.zsh/functions.zsh" ]] && source "$__home/.zsh/functions.zsh" "$__home" "$__data"
}

if [[ -n $action ]]; then
  eval "hook_$action"
fi
