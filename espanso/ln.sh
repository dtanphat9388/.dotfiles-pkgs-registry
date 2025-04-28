#!/bin/bash

if [[ -L $HOME/.config/espanso ]]; then
  ln -sfn $DF_CONFIGS/espanso $HOME/.config
fi
