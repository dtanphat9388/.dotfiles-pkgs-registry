#!/bin/bash

cloudflared_brew() {
  brew install cloudflare/cloudflare/cloudflared
}

cloudflared_apt() {
  wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && sudo dpkg -i cloudflared-linux-amd64.deb
}

if [[ $DF_IS_HOMEBREW ]]; then
  cloudflared_brew
elif [[ $DF_IS_APT ]]; then
  cloudflared_apt
fi
