#!/bin/bash

asdf plugin add kubectl
kubectl completion zsh >$ZSH_COMPLETIONS_DIR/_kubectl
