#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# load brew
#
[[ $DF_IS_LINUX ]] && export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
# apple silicon
[[ $DF_IS_ARCH_ARM ]] && export PATH="$PATH:/opt/homebrew"
# apple intel
[[ $DF_IS_MACOS ]] && export PATH="$PATH:/usr/local"
