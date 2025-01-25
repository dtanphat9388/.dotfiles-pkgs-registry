#!/bin/bash

vscode_brew() {
  brew install --cask --no-quarantine visual-studio-code
  # -- enable repeat key for vscode (when press n or k key)
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
}

## không cài bằng snap để tránh lỗi keybinding Ctrl+Shift+E và Ctrl+Shift+U
vscode_apt() {
  sudo apt-get install wget gpg
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
  sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
  rm -f packages.microsoft.gpg
  sudo apt install apt-transport-https
  sudo apt update
  sudo apt install code # code | code-insiders
}

echo -- Installing apps/vscode
if [[ $DF_IS_MACOS ]]; then
  vscode_brew
elif [[ $DF_IS_APT ]]; then
  vscode_apt
fi
