#!/bin/bash

if [[ $DF_IS_TERM_VSCODE ]]; then
  export KUBE_EDITOR='code --wait'
elif [[ $DF_IS_TERM_TMUX ]]; then
  export KUBE_EDITOR='nvim'
fi

if [[ -f "$DF_CONFIGS/kubectl/env.sh" ]]; then
  source "$DF_CONFIGS/kubectl/env.sh"
fi

export KUBECONFIG=$DF_HOME/.kube/config
