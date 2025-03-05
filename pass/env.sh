#!/bin/bash

__home=$1
__profile=$2

# Overrides the default password storage directory
export PASSWORD_STORE_DIR="$DF_HOME/pass"

# Specifies the number of seconds to wait before restoring the clipboard, by default 45 seconds.
export PASSWORD_STORE_CLIP_TIME=60

if [[ -f "$DF_CONFIGS/pass/env.sh" ]]; then
  source "$DF_CONFIGS/pass/env.sh"
fi
