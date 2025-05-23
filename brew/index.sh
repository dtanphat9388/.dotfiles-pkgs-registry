#!/bin/bash

__dirname=$(dirname "$0")
__home="$DF_HOME"

action=$1

hook_info() {
  echo your description here
}

hook_dependencies() {
  return
  # echo curl
}

hook_check() {
  if [[ $DF_IS_MACOS && $DF_IS_ARCH_INTEL ]]; then
    [[ -d "/usr/local" ]]
  elif [[ $DF_IS_MACOS && $DF_IS_ARCH_ARM ]]; then
    [[ -d "/opt/homebrew" ]]
  else
    [[ -d "/home/linuxbrew/.linuxbrew" ]]
  fi
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
  [[ -f $lnFile ]] && bash "$lnFile" "$__dirname" "$__home"
}

hook_env() {
  envFile=$__dirname/env.sh
  [[ -f $envFile ]] && source "$envFile"
}

hook_zsh() {
  local zshFile=$__dirname/zsh.sh
  [[ -f $zshFile ]] && source "$zshFile"
}

if [[ -n $action ]]; then
  eval "hook_$action"
fi
