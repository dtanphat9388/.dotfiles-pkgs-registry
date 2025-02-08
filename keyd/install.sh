#!/bin/bash

if [[ $DF_IS_LINUX ]]; then
  local clonefolder=/tmp/keyd
  git clone https://github.com/rvaiya/keyd $clonefolder
  cd $clonefolder
  make && sudo make install
  sudo systemctl enable keyd && sudo systemctl start keyd

fi

sudo ln -sfn $DF_CONFIGS/keyd/app.conf $HOME/.config/keyd/app.conf
sudo ln -sfn $DF_CONFIGS/keyd/default.conf /etc/keyd/default.conf
