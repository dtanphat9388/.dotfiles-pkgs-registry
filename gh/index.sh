#!/bin/bash
#shellcheck source=/dev/null

__home_lib=$(dirname "$0")
__home_data="$DOTFILES_PROFILE_HOME"

action=$1

hook_info() {
  echo Github CLI
}

hook_check() {
  command -v gh
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
  [[ -f "$__home_lib/.zsh/aliases.zsh" ]] && source "$__home_lib/.zsh/aliases.zsh" "$__home_lib" "$__home_data"
  [[ -f "$__home_lib/.zsh/functions.zsh" ]] && source "$__home_lib/.zsh/functions.zsh" "$__home_lib" "$__home_data"
}

if [[ -n $action ]]; then
  eval "hook_$action"
fi
