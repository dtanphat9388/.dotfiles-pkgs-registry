#!/bin/bash

function install_postman() {
  echo installing apps/postman
  if [[ $DF_IS_MACOS ]]; then
    postman_brew
  elif [[ $DF_IS_APT ]]; then
    postman_apt
  fi
}

function postman_brew() {
  brew install --cask postman
}

function postman_apt() {
  sudo snap install postman
}
