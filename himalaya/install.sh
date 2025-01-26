#!/bin/bash

brew install himalaya
himalaya completion zsh >$ZSH_COMPLETIONS_DIR/_himalaya && source $ZSH_COMPLETIONS_DIR/_himalaya
