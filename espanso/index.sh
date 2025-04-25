#!/bin/bash

__dirname=$(dirname "$0")
__home="$DF_HOME"

action=$1

hook_info() {
  echo OS level snippet
}

hook_check() {
  command -v espanso
}

hook_install() {
  local installFile=$__dirname/install.sh
  [[ -f $installFile ]] && bash "$installFile"
}

hook_uninstall() {
  local uninstallFile=$__dirname/uninstall.sh
  [[ -f $uninstallFile ]] && bash "$uninstallFile"
}

hook_upgrade() {
  local upgradeFile=$__dirname/upgrade.sh
  [[ -f $upgradeFile ]] && bash "$upgradeFile"
}

hook_link() {
  local lnFile=$__dirname/ln.sh
  [[ -f $lnFile ]] && bash "$lnFile"
}

hook_env() {
  local envFile=$__dirname/env.sh
  [[ -f $envFile ]] && source "$envFile"
}

hook_zsh() {
  local zshFile=$__dirname/zsh.sh
  [[ -f $zshFile ]] && source "$zshFile"
}

if [[ -n $action ]]; then
  eval "hook_$action"
fi
