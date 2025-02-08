#!/bin/bash

export KUBECONFIG=$DF_HOME/.kube/config

if [[ $DF_IS_TERM_VSCODE ]]; then
  export KUBE_EDITOR='code --wait'
elif [[ $DF_IS_TERM_TMUX ]]; then
  export KUBE_EDITOR='nvim'
fi

if [[ -f "$DF_CONFIGS/kubectl/env.zsh" ]]; then
  source "$DF_CONFIGS/kubectl/env.zsh"
fi
