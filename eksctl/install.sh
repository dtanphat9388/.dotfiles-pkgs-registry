#!/bin/bash

eksctl_brew() {
  brew tap weaveworks/tap
  brew install weaveworks/tap/eksctl
}

eksctl_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  eksctl_brew
elif [[ $DF_IS_APT ]]; then
  eksctl_apt
fi
