#!/bin/bash

__home=$1

sudo ln -sfn $DF_CONFIGS/keyd/app.conf $HOME/.config/keyd/app.conf
sudo ln -sfn $DF_CONFIGS/keyd/default.conf /etc/keyd/default.conf
