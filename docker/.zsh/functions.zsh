#!/bin/bash

dockerns() {
  local DOCKER_CONFIGS=$DF_HOME/.docker/configs
  local selected="$DOCKER_CONFIGS/$(fd . $DOCKER_CONFIGS -x echo '{/}' | fzf)"
  ln -sf $selected "$DOCKER_CONFIGS/../current.sh"
  source $selected
}

dockergc() {
  docker system prune -f
}

dockergca() {
  dockergc
  docker image prune -af
}
