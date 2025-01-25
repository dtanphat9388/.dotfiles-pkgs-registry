#!/bin/bash

psql_brew() {
  brew install libpq
  brew link --force libpq
}

psql_apt() {
  sudo apt install postgresql-client
}

if [[ $DF_IS_HOMEBREW ]]; then
  psql_brew
elif [[ $DF_IS_APT ]]; then
  psql_apt
fi
