#!/bin/bash

if [[ $DF_IS_APT ]]; then
  sudo apt update
  sudo apt install snapd
fi
