#!/bin/bash

function osgc() {
  echo apt cleanup
  {
    sudo apt --fix-broken install 1>/dev/null
    sudo apt-get update
    sudo apt-get autoclean
    sudo apt-get clean
    sudo apt-get autoremove
    sudo apt-get install ppa-purge
  } &>/dev/null
  # remove history
  echo cleanup command history
  {
    history -c
  } 1>/dev/null

  echo brew cleanup
  if [[ $(command -v brew) ]]; then
    {
      echo brew cleanup
      brew cleanup --prune=all 1>/dev/null
    } 1>/dev/null
  fi

  echo remove random tempdir 
  rm -rf /tmp/tmp.* 1>/dev/null
}
