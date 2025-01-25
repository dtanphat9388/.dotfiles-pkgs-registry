#!/bin/bash

if [[ $DF_IS_MACOS ]]; then
  alias vpn=tunnelblickctl
else
  alias vpn=openvpn3
fi
