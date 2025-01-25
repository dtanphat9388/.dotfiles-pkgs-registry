#!/bin/bash

if [[ -d "$DF_CONFIGS/fd" ]]; then
  ln -sfn $DF_CONFIGS/fd $HOME/.config
fi
