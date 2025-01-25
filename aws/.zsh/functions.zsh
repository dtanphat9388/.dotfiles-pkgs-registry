#!/bin/bash

# -- completion
complete -C '/usr/local/bin/aws_completer' aws

#-- functions
awsman() {
  open https://awscli.amazonaws.com/v2/documentation/api/latest/index.html
}

ans() {
  local ns=$(aws configure list-profiles | fzf | awk '{print $1}')
  export AWS_PROFILE="$ns"
}

ecrpwd() {
  echo -n $(aws ecr get-login-password --region ap-southeast-1) | pbcopy
}

ecrlogin() {
  aws ecr get-login-password --region ap-southeast-1 | docker login --username AWS --password-stdin 414278468490.dkr.ecr.ap-southeast-1.amazonaws.com
}
