#!/bin/bash

export TMUX_CONFIG=$DF_CONFIGS/tmux/tmux.conf
export TMUX_DEFAULT_SESSION_NAME=terminal
export TMUX_DEFAULT_WINDOW_NAME=term

[[ -f "$DF_CONFIGS/tmux/env.zsh" ]] && source "$DF_CONFIGS/tmux/env.zsh"
