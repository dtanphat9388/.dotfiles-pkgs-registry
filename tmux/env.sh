#!/bin/bash

export TMUX_CONFIG=$DF_CONFIGS/tmux/tmux.conf
export TMUX_DEFAULT_SESSION_NAME=terminal
export TMUX_DEFAULT_WINDOW_NAME=term

if [[ -f "$DF_CONFIGS/tmux/env.zsh" ]]; then
  source "$DF_CONFIGS/tmux/env.zsh"
fi
