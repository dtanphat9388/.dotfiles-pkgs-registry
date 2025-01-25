#!/bin/bash

function install_aws-cli() {
  echo -- install aws cli v2
  brew install awscli
}

function install_aws-iam-authenticator() {
  echo -- install aws-iam-authenticator
  curl https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.5.9/aws-iam-authenticator_0.5.9_linux_amd64 -Lo "/tmp/aws-iam-authenticator"
  chmod +x /tmp/aws-iam-authenticator
  sudo cp /tmp/aws-iam-authenticator /usr/local/bin/aws-iam-authenticator
}

install_aws-cli
install_aws-iam-authenticator
