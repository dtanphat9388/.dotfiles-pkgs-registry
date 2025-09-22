#!/bin/bash

if [[ $DF_IS_LINUX ]]; then
  # Remove the Nix daemon service:
  sudo systemctl stop nix-daemon.service
  sudo systemctl disable nix-daemon.socket nix-daemon.service
  sudo systemctl daemon-reload

  # Remove files created by Nix:
  sudo rm -rf /etc/nix /etc/profile.d/nix.sh /etc/tmpfiles.d/nix-daemon.conf /nix ~root/.nix-channels ~root/.nix-defexpr ~root/.nix-profile

  # Remove build users and their group:
  for i in $(seq 1 32); do
    sudo userdel nixbld$i
  done
  sudo groupdel nixbld
fi

if [[ $DF_IS_MACOS ]]; then
  echo "view all commands here: https://nix.dev/manual/nix/2.18/installation/uninstall#macos"
fi
