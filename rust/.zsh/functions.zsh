#!/bin/bash

[[ ! -d ~/.zfunc ]] && mkdir ~/.zfunc
[ ! -s ~/.zfunc/_rustup ] && rustup completions zsh >~/.zfunc/_rustup
[ ! -s ~/.zfunc/_cargo ] && rustup completions zsh cargo >~/.zfunc/_cargo
fpath+=~/.zfunc
