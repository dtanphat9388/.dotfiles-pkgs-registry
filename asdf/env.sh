#!/bin/bash

#-- source exe file
if [[ $DF_IS_LINUX ]]; then
  ASDF_EXE_PATH="$(brew --prefix asdf)/libexec/asdf.sh"
  [[ ! "$ASDF_EXE_PATH" ]] && return
  . "$ASDF_EXE_PATH"
fi

export ASDF_CONFIG_FILE=$DF_CONFIGS/asdf/.asdfrc

if [[ -f "$DF_CONFIGS/asdf/env.zsh" ]]; then
  source "$DF_CONFIGS/asdf/env.zsh"
fi

if [[ -f "$DF_HOME/asdf/env.zsh" ]]; then
  source "$DF_HOME/asdf/env.zsh"
fi
