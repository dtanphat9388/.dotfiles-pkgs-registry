#!/bin/bash

# load rust PATH
. "$HOME/.cargo/env"

if [[ -f "$DF_CONFIGS/rust/env.sh" ]]; then
  source "$DF_CONFIGS/rust/env.sh"
fi

if [[ -f "$DF_HOME/rust/env.sh" ]]; then
  source "$DF_HOME/rust/env.sh"
fi
