#!/bin/bash

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup completions zsh >$ZSH_COMPLETIONS_DIR/_rustup
rustup completions zsh cargo >$ZSH_COMPLETIONS_DIR/_cargo
