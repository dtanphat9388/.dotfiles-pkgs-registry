#!/bin/bash

# description: azure cli

azure_cli_brew() {
  brew install azure_cli
}

azure_cli_apt() {
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
}

if [[ $DF_IS_HOMEBREW ]]; then
  azure_cli_brew
elif [[ $DF_IS_APT ]]; then
  azure_cli_apt
fi
