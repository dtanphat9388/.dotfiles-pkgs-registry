#!/bin/bash

__dirname=$(dirname "$0")
__home="$DF_HOME"

action=$1

hook_info() {
  echo find command alternative
}

hook_check() {
  if [[ $DF_IS_MACOS ]]; then
    command -v fd
  else
    command -v fdfind
  fi
}

hook_dependencies() {
  echo brew
}

hook_install() {
  installFile=$__dirname/install.sh
  [[ -f $installFile ]] && bash "$installFile" "$__dirname"
}

hook_uninstall() {
  uninstallFile=$__dirname/uninstall.sh
  [[ -f $uninstallFile ]] && bash "$uninstallFile" "$__dirname"
}

hook_upgrade() {
  upgradeFile=$__dirname/upgrade.sh
  [[ -f $upgradeFile ]] && bash "$upgradeFile"
}

hook_link() {
  lnFile=$__dirname/ln.sh
  [[ -f $lnFile ]] && bash "$lnFile"
}

hook_env() {
  envFile=$__dirname/env.sh
  [[ -f $envFile ]] && source "$envFile"
}

hook_zsh() {
  zshFile=$__dirname/zsh.sh
  [[ -f $zshFile ]] && source "$zshFile"
}

if [[ -n $action ]]; then
  eval "hook_$action"
fi
