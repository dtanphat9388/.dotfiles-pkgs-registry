#!/bin/bash

# https://macos-defaults.com/#%F0%9F%99%8B-what-s-a-defaults-command
os_conf() {
  # [Dock]
  # -- remove default items in Dock on new setup
  defaults write com.apple.dock static-only -bool true
  # -- Do not show recents app
  defaults write com.apple.dock "show-recents" -bool "false"
  # -- auto hide
  defaults write com.apple.dock "autohide" -bool "true"
  # -- Change the Dock minimize animation
  defaults write com.apple.dock "mineffect" -string "scale"
  killall Dock

  # [Safari]
  # -- show full URL
  defaults write com.apple.safari "ShowFullURLInSmartSearchField" -bool "true"
  killall Safari

  # [Screen shoot]
  # -- image format
  defaults write com.apple.screencapture "type" -string "jpg"

  # [Miscellaneous]
  # -- Repeats the key as long as it is held down.
  defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"
}

os_conf
