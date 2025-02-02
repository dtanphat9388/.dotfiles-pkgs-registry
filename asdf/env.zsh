#!/bin/bash

__home=$1
__data=$2

#-- source exe file
if [[ $DF_IS_LINUX ]]; then
  ASDF_EXE_PATH="$(brew --prefix asdf)/libexec/asdf.sh"
  [[ ! "$ASDF_EXE_PATH" ]] && return
  . "$ASDF_EXE_PATH"
fi

export ASDF_CONFIG_FILE=$DF_CONFIGS/asdf/.asdfrc
