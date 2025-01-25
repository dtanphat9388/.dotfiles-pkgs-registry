#!/bin/bash

__home=$(dirname $0)

action=$1

hook_info() {
  echo postman like in CLI
}

hook_check() {
  command -v hurl
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
  [[ -f $upgradeFile ]] && bash $upgradeFile $__home
}

hook_link() {
  lnFile=$__home/ln.sh
  [[ -f $lnFile ]] && bash $lnFile $__home
}

hook_env() {
  envFile=$__home/env.zsh
  [[ -f $envFile ]] && source $envFile $__home
}

hook_zsh() {
  [[ -f "$__home/.zsh/aliases.zsh" ]] && source "$__home/.zsh/aliases.zsh" "$__home" "$__data"
  [[ -f "$__home/.zsh/functions.zsh" ]] && source "$__home/.zsh/functions.zsh" "$__home" "$__data"
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
