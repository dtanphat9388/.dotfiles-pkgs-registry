#!/bin/bash

if [[ $DF_IS_LINUX ]]; then
  local clonefolder=/tmp/keyd
  git clone https://github.com/rvaiya/keyd $clonefolder
  cd $clonefolder
  make && sudo make install
  sudo systemctl enable keyd && sudo systemctl start keyd
fi
