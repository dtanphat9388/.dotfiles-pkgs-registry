#!/bin/bash

OS=$(uname)

vpndis() {
  local name=$(vpnps)
  [[ -z $name ]] && exit
  if [[ $DF_IS_MACOS ]]; then
    vpn disconnect $con_name
  else
    vpn session-manage -c $name --disconnect
  fi
}

vpndisa() {
  if [[ $DF_IS_MACOS ]]; then
    vpn disconnect --all
  else
    local name=$(vpnps)
    [[ -z $name ]] && return
    vpn session-manage -c $name --disconnect
  fi
}

vpncon() {
  local name=$(vpnls)
  [[ -z $name ]] && return
  if [[ $DF_IS_MACOS ]]; then
    vpn connect $name
  else
    vpn session-start -c $name
  fi
}

vpnrestart() {
  local name=$1
  [[ -z $name ]] && return
  if [[ $DF_IS_MACOS ]]; then
    echo 'no command'
  else
    vpn session-manage -c $name --restart
  fi
}

vpngc() {
  if [[ $DF_IS_MACOS ]]; then
    echo "no command"
  else
    vpn session-manage --cleanup
  fi
}

vpnls() {
  if [[ $DF_IS_MACOS ]]; then
    vpn status | grep EXITING | fzf | awk '{print $1}'
  else
    vpn configs-list | grep $USER | awk '{print $1}' | fzf
  fi
}

vpnps() {
  if [[ $DF_IS_MACOS ]]; then
    vpn status | grep CONNECTED | fzf | awk '{print $1}'
  else
    vpn sessions-list | grep 'Config name:' | awk '{print $3}' | fzf
  fi
}

vpnconf() {
  vpn config-manage
}

vpnrm() {
  local name=$(vpnls)
  if [[ $DF_IS_MACOS ]]; then
    echo 'no command'
  else
    vpn config-remove --force -c $name
  fi
}

vpnrename() {
  local old=$1
  local new=$2
  if [[ $DF_IS_MACOS ]]; then
    echo "no command"
  else
    vpn config-manage -c $old -r $new
  fi
}

vpnadd() {
  local import_name=$1
  local import_path=$2
  if [[ $DF_IS_MACOS ]]; then
    echo "no command"
  else
    vpn config-import -p -n ${import_name} -c ${import_path}
  fi
}

vpndump() {
  selected=$(vpnls)
  [[ -n $selected ]] && vpn config-dump -c $selected >"${selected}.ovpn"
  return
}
