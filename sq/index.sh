#!/bin/bash
#shellcheck source=/dev/null

__dirname=$(dirname "$0")
__home="$DF_HOME"

action=$1

hook_info() {
  echo your description here
}

hook_dependencies() {
  #   # style more
  #   declare -a deps=("brew" "npm")
  #   echo ${deps[@]}
  #   # style little
  #   echo "dep1"
  #   echo "dep2"
  return
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
  envFile=$__dirname/env.zsh
  [[ -f $envFile ]] && source "$envFile" "$__dirname" "$__home"
}

hook_zsh() {
  [[ -f "$__dirname/.zsh/aliases.zsh" ]] && source "$__dirname/.zsh/aliases.zsh" "$__dirname" "$__home"
  [[ -f "$__dirname/.zsh/functions.zsh" ]] && source "$__dirname/.zsh/functions.zsh" "$__dirname" "$__home"
  # -- note: place by order
  # YOUR_COMMAND() {
  #   unset -f $0
  #   # $0 completion zsh (if have)
  #   [[ -f "$__dirname/.zsh/aliases.zsh" ]] && source "$__dirname/.zsh/aliases.zsh" "$__dirname" "$__home"
  #   [[ -f "$__dirname/.zsh/functions.zsh" ]] && source "$__dirname/.zsh/functions.zsh" "$__dirname" "$__home"
  #   $0 "$@"
  # }
}

if [[ -n $action ]]; then
  eval "hook_$action"
fi
