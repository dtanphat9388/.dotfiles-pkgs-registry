#!/bin/bash

__home=$(dirname $0)

action=$1

hook_check() {
  command -v vault
}

hook_install() {
  installFile=$__home/install.sh
  [[ -f $installFile ]] && bash $installFile $__home
}

hook_uninstall() {
  uninstallFile=$__home/uninstall.sh
  [[ -f $uninstallFile ]] && bash $uninstallFile $__home
}

hook_link() {
  lnFile=$__home/ln.sh
  [[ -f $lnFile ]] && bash $lnFile $__home
}

hook_zsh() {
  vault() {
    unset -f $0
    complete -o nospace -C /usr/local/bin/vault vault
    source $__home/.zsh/functions.zsh
    $0 "$@"
  }
}

hook_env() {
  envFile=$__home/env.zsh
  [[ -f $envFile ]] && source $envFile
}

if [[ $action == "check" ]]; then
  hook_check
elif [[ $action == "install" ]]; then
  hook_install
elif [[ $action == "uninstall" ]]; then
  hook_uninstall
elif [[ $action == "link" ]]; then
  hook_link
elif [[ $action == "zsh" ]]; then
  hook_zsh
elif [[ $action == "env" ]]; then
  hook_env
fi
