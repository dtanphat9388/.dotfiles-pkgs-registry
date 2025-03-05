#!/bin/bash

if [[ $DF_IS_HOMEBREW ]]; then
  is_libpq="$(brew --prefix libpq)/bin"
  if [[ -d $is_libpq ]]; then
    export PATH="$is_libpq:$PATH"
  fi
fi

export PSQLRC="$DF_CONFIGS/postgresql/.psqlrc"

# colorized output
export PG_COLOR="always"
# config color
# https://www.postgresql.org/docs/current/color-which.html
# export PG_COLORS="error=01;31:warning=01;35:note=01;36:locus=01"
#
#
if [[ -f "$DF_CONFIGS/postgresql/env.sh" ]]; then
  source "$DF_CONFIGS/postgresql/env.sh"
fi

if [[ -f "$DF_HOME/postgresql/env.sh" ]]; then
  source "$DF_HOME/postgresql/env.sh"
fi
