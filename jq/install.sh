#!/bin/bash

# description: jsom parser

jq_brew() {
  brew install jq
}

jq_apt() {
  apt install -y jq
}

if [[ $DF_IS_HOMEBREW ]]; then
  jq_brew
elif [[ $DF_IS_APT ]]; then
  jq_apt
fi
