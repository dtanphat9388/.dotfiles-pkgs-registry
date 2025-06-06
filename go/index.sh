#!/bin/bash
#shellcheck source=/dev/null

__dirname=$(dirname "$0")
__home="$DF_HOME"

action=$1

hook_info() {
  echo go language of google
}

hook_check() {
  command -v go
}

hook_dependencies() {
  echo asdf
  echo golangci-lint
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
  [[ -f $envFile ]] && source "$envFile" "$__dirname" "$__home"
}

hook_zsh() {
  zshFile=$__dirname/zsh.sh
  [[ -f $zshFile ]] && source "$zshFile" "$__dirname" "$__home"
}

if [[ -n $action ]]; then
  eval "hook_$action"
fi
