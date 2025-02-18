#!/bin/bash

__dirname=$(dirname "$0")
__home="$DF_HOME"

action=$1

hook_info() {
  echo your description here
}

# status code:
# 0: success
# 1: error
# 2: OS not supported
# 3: load condition not match
# 4: disabled
#### ex: not load nvm or nodejs if current working dir not have file package.json or any js,ts file
#### [[ ! -f "$PWD/package.json" ]] || [[ ! -f "$PWD/*.js" ]] && return 3
hook_check() {
  # return 2 if not match with OS
  # [[ ! $DF_IS_MACOS ]] && return 2
  if [[ $DF_IS_MACOS ]]; then
    [[ -x "/Applications/your_app.app" ]]
  else
    command -v your_app
  fi
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
