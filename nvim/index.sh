#!/bin/bash

__dirname=$(dirname "$0")
__home="$DF_HOME"

action=$1

hook_info() {
  echo text based IDE
}

hook_check() {
  command -v nvim
}

hook_dependencies() {
  echo brew nodejs tmux
}

hook_install() {
  installFile=$__dirname/install.sh
  [[ -f $installFile ]] && bash "$installFile" "$__dirname"
  hook_link
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
  envFile=$__dirname/env.zsh
  [[ -f $envFile ]] && source "$envFile" "$__dirname" "$__home"
}

hook_zsh() {
  [[ -f "$__dirname/.zsh/aliases.zsh" ]] && source "$__dirname/.zsh/aliases.zsh" "$__dirname" "$__home"
  [[ -f "$__dirname/.zsh/functions.zsh" ]] && source "$__dirname/.zsh/functions.zsh" "$__dirname" "$__home"
}

if [[ -n $action ]]; then
  eval "hook_$action"
fi
