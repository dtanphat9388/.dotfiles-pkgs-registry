#!/bin/bash

__home=$(dirname $0)

action=$1

hook_name() {
	echo "kicad"
}
hook_check() {
	if [[ $DF_IS_MACOS ]]; then
		[[ -x "/Applications/kicad.app" ]]
	else
		command -v kicad
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

hook_link() {
	lnFile=$__home/ln.sh
	[[ -f $lnFile ]] && bash $lnFile $__home
}

hook_env() {
	envFile=$__home/env.zsh
	[[ -f $envFile ]] && source $envFile $__home
}

hook_zsh() {
	return # remove return if have zsh files
	# note: place by order
	source $__home/.zsh/aliases.zsh
	source $__home/.zsh/functions.zsh
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
