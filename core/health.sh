#!/bin/bash

# status code:
# 0: success
# 1: error
# 2: OS not supported
# 3: load condition not match
# 4: disabled
#### ex: not load nvm or nodejs if current working dir not have file package.json or any js,ts file
#### [[ ! -f "$PWD/package.json" ]] || [[ ! -f "$PWD/*.js" ]] && return 3
hook_check() {
  # return 2 if not match with OS
  # [[ ! $DF_IS_MACOS ]] && return 2
  if [[ $DF_IS_MACOS ]]; then
    [[ -x "/Applications/your_app.app" ]]
  else
    command -v your_app
  fi
}
