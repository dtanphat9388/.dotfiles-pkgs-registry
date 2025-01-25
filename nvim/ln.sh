#!/bin/bash

__home=$1

ln -sfn "$DF_CONFIGS/nvim" "$HOME/.config"
ln -sfn "$__home/configs/lazyvim" "$HOME/.config"
