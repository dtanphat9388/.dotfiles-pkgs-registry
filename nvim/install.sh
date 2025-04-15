#!/bin/bash

neovim_brew() {
  brew install neovim
  brew install mercurial
  # brew install ripgrep
  brew install fswatch
  brew install luarocks
}

neovim_apt() {
  sudo apt install -y neovim
  sudo apt-get install mercurial
  sudo apt-get install ripgrep
  sudo apt install python3.10-venv # used by mason-tool nvim plugin
  sudo apt install luarocks
}

if [[ $DF_IS_HOMEBREW ]]; then
  neovim_brew
elif [[ $DF_IS_APT ]]; then
  neovim_apt
fi

npm install -g tree-sitter-cli
