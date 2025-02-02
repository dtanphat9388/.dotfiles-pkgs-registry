#!/bin/bash

wifi() {
  action=$1
  case $action in
    show-password) show-password ;;
    *) show-help ;;
  esac

}

function show-password() {
  nmcli d wifi show-password
}

function show-help() {
  echo show-password : show wifi password
}
