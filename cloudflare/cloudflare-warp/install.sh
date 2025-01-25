#!/bin/bash

## Free VPN of CloudFlare

cloudflarevpn_brew() {
  brew install --cask --no-quarantine cloudflare-warp
}

cloudflarevpn_apt() {
  curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
  sudo apt update
  sudo apt install cloudflare-warp
  warp-cli register
}

echo -- install apps/cloudflare
if [[ $DF_IS_MACOS ]]; then
  cloudflarevpn_brew
elif [[ $DF_IS_LINUX ]]; then
  cloudflarevpn_apt
fi
