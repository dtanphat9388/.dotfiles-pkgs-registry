#!/bin/bash

__dirname=$(dirname "$0")

action=$1

hook_check() {
  command -v alacritty
}

hook_dependencies() {
  if [[ $DF_IS_MACOS ]]; then
    echo brew
  fi
  echo tmux
}

hook_install() {
  installFile=$__dirname/install.sh
  [[ -f $installFile ]] && bash "$installFile" "$__dirname"
  hook_link
}

hook_generate_configs() {
  if [[ ! -d "$DF_CONFIGS/alacritty" ]]; then
    cp -r $__dirname/configs/alacritty $DF_CONFIGS
  fi
}

hook_uninstall() {
  uninstallFile=$__dirname/uninstall.sh
  [[ -f $uninstallFile ]] && bash "$uninstallFile" "$__dirname"
}

hook_link() {
  lnFile=$__dirname/ln.sh
  [[ -f $lnFile ]] && bash "$lnFile" "$__dirname"
}

hook_env() {
  envFile=$__dirname/env.zsh
  [[ -f $envFile ]] && source "$envFile"
}

hook_zsh() {
  return # remove return if have zsh files
  # note: place by order
  # source "$__dirname/.zsh/aliases.zsh"
  # source "$__dirname/.zsh/functions.zsh"
}

if [[ $action == "check" ]]; then
  hook_check
elif [[ $action == "install" ]]; then
  hook_install
elif [[ $action == "uninstall" ]]; then
  hook_uninstall
elif [[ $action == "link" ]]; then
  hook_link
elif [[ $action == "env" ]]; then
  hook_env
elif [[ $action == "zsh" ]]; then
  hook_zsh
fi
