#!/bin/bash

brew install gh
gh extension install dlvhdr/gh-dash

gh completion -s zsh >$ZSH_COMPLETIONS_DIR/_gh
source $ZSH_COMPLETIONS_DIR/_gh
