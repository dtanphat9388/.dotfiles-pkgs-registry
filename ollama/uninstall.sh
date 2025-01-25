#!/bin/bash

app_brew_uninstall() {
  brew uninstall ollama
}

app_apt_uninstall() {
  # Remove the ollama service:
  sudo systemctl stop ollama
  sudo systemctl disable ollama
  sudo rm /etc/systemd/system/ollama.service
  # Remove the ollama binary from your bin directory (either /usr/local/bin, /usr/bin, or /bin):
  sudo rm $(which ollama)
  # Remove the downloaded models and Ollama service user and group:
  sudo rm -r /usr/share/ollama
  sudo userdel ollama
  sudo groupdel ollama
}

if [[ $DF_IS_MACOS ]]; then
  app_brew_uninstall
elif [[ $DF_IS_LINUX ]]; then
  app_apt_uninstall
fi
