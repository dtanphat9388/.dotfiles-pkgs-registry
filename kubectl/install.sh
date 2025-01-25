#!/bin/bash

kubectl_brew() {
	brew install kubectl
}

kubectl_apt() {
	return
}

if [[ $DF_IS_HOMEBREW ]]; then
	kubectl_brew
elif [[ $DF_IS_APT ]]; then
	kubectl_apt
fi
kubectl completion zsh >$ZSH_COMPLETIONS_DIR/_kubectl
