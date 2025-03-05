#!/bin/bash

export ZK_NOTEBOOK_DIR="$HOME/.notes"

if [[ -f "$DF_CONFIGS/zk/env.sh" ]]; then
  source "$DF_CONFIGS/zk/env.sh"
fi
