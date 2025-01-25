#!/bin/bash

cheat_brew() {
  brew install cheat
}

cheat_apt() {
  return
}

if [[ $DF_IS_HOMEBREW ]]; then
  cheat_brew
elif [[ $DF_IS_APT ]]; then
  cheat_apt
fi

#-- install community cheatsheets
CHEATSHEETS_COMMUNITY="$HOME/.config/cheat/cheatsheets/community"
[[ ! -d $CHEATSHEETS_COMMUNITY ]] && git clone https://github.com/cheat/cheatsheets $CHEATSHEETS_COMMUNITY

CHEATSHEETS_PERSONAL="~/.config/cheat/cheatsheets/personal"
