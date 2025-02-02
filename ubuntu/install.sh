#!/bin/bash

__home=$1

os_required() {
  sudo apt install git node-typescript make
}

install_gnome_tweats() {
  echo os -- setup gnome-tweats
  sudo apt install gnome-tweaks 1>/dev/null
  echo os -- setup gnome-shell-extensions
  sudo apt install gnome-shell-extensions 1>/dev/null
  sudo apt install gnome-browser-connector
}

os_conf_dump() {
  dconf dump / >$DF_CONFIGS/os/ubuntu/gnome_settings.dconf
}

os_conf_load() {
  dconf load -f / <$DF_CONFIGS/os/ubuntu/gnome_settings.dconf
}

# use forge
install_tilling_window_manager() {
  return
}

os_required
install_gnome_tweats
os_conf_load
# echo remove shortcut in emoji tab to fix ctrl+shift+e and ctrl+shift+u
# ibus-setup
# language > chuyen ibus -> XIM
