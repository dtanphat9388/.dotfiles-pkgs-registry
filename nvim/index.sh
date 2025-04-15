#!/bin/bash
#shellcheck source=/dev/null

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
  echo brew tmux deno
  echo ripgrep # use by grep command in nvim
}

hook_install() {
  installFile=$__dirname/install.sh
  [[ -f $installFile ]] && bash "$installFile"
}

hook_uninstall() {
  uninstallFile=$__dirname/uninstall.sh
  [[ -f $uninstallFile ]] && bash "$uninstallFile"
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
  envFile=$__dirname/env.zsh
  [[ -f $envFile ]] && source "$envFile"
}

hook_zsh() {
  zshFile=$__dirname/zsh.sh
  [[ -f $zshFile ]] && source "$zshFile"
}

if [[ -n $action ]]; then
  eval "hook_$action"
fi
