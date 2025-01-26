#!/bin/bash

__home=$(dirname $0)
__data="$DF_HOME"

action=$1

hook_info() {
	echo Fast node version manager
}

hook_check() {
	if [[ $DF_IS_MACOS ]]; then
		[[ -f "/usr/local/bin/fnm" ]]
	else
		[[ -d "$HOME/.local/share/fnm" ]]
	fi
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
	[[ -f $upgradeFile ]] && bash $upgradeFile
}

hook_link() {
	lnFile=$__home/ln.sh
	[[ -f $lnFile ]] && bash $lnFile $__home $__data
}

hook_env() {
	envFile=$__home/env.zsh
	[[ -f $envFile ]] && source $envFile $__home $__data
}

hook_zsh() {
	fnm() {
		unset -f $0
		eval "$(fnm env --use-on-cd)"
		$0 completions --shell zsh
		[[ -f "$__home/.zsh/aliases.zsh" ]] && source "$__home/.zsh/aliases.zsh" "$__home" "$__data"
		[[ -f "$__home/.zsh/functions.zsh" ]] && source "$__home/.zsh/functions.zsh" "$__home" "$__data"
		$0 "$@"
	}
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
