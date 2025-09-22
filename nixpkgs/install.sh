#!/bin/bash

if [[ $DF_IS_LINUX ]]; then
  sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
elif [[ $DF_IS_MACOS ]]; then
  sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
fi
