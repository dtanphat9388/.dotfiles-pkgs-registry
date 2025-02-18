#!/bin/bash

asdf plugin add kubectl
asdf install kubectl latest
asdf global kubectl latest

kubectl completion zsh >$ZSH_COMPLETIONS_DIR/_kubectl
source $ZSH_COMPLETIONS_DIR/_kubectl
