#!/bin/bash
#shellcheck source=/dev/null

__home_lib=$(dirname "$0")
__home_data="$DF_HOME"

action=$1

hook_info() {
  echo keyboard remaping for Macos
}

hook_check() {
  if [[ $DF_IS_MACOS ]]; then
    [[ -x "/Applications/Karabiner-Elements.app" ]]
  else
    return 2
  fi
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
  # -- note: place by order
  [[ -f "$__home_lib/.zsh/aliases.zsh" ]] && source "$__home_lib/.zsh/aliases.zsh" "$__home_lib" "$__home_data"
  [[ -f "$__home_lib/.zsh/functions.zsh" ]] && source "$__home_lib/.zsh/functions.zsh" "$__home_lib" "$__home_data"
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
