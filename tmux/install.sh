#!/bin/bash

brew install tmux
if [[ $DF_IS_LINUX ]]; then
  # as pbcopy in macos
  sudo apt-get install -y xsel
  # tmux session manager
  sudo apt-get install -y tmuxinator
fi
