#!/bin/bash

find $DF_PACKAGES -name "env.zsh"
find . -type f -name "env.zsh" -exec sh -c 'mv "$1" "${1%.zsh}.sh"' _ {} \;
