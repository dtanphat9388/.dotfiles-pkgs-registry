#!/bin/bash

__home=$1

sudo ln -sfn $__home/configs/app.conf $HOME/.config/keyd/app.conf
sudo ln -sfn $__home/configs/default.conf /etc/keyd/default.conf
