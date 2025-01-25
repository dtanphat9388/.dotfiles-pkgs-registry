#!/bin/bash

#-- autocomplete
[[ ! -s "$ZSH_COMPLETIONS_DIR/_deno" ]] && deno completions zsh >$ZSH_COMPLETIONS_DIR/_deno

#-- functions
