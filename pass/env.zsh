#!/bin/bash

__home=$1
__profile=$2

# Overrides the default password storage directory
export PASSWORD_STORE_DIR="$__profile/pass"

# Specifies the number of seconds to wait before restoring the clipboard, by default 45 seconds.
export PASSWORD_STORE_CLIP_TIME=60
