#!/bin/bash

neovim_brew_uninstall() {
    brew uninstall neovim
}

neovim_apt_uninstall() {
    sudo apt-get purge --auto-remove neovim
}

if [[ $DF_IS_HOMEBREW ]]; then
    neovim_brew_uninstall
elif [[ $DF_IS_APT ]]; then
    neovim_apt_uninstall
fi

npm uninstall -g tree-sitter-cli

# -- remove nvim data
rm -rf ~/.local/share/nvim

