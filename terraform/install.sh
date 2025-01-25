#!/bin/bash

terraform_brew() {
  brew tap hashicorp/tap
  brew install hashicorp/tap/terraform
}

terraform_apt() {
  wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
  sudo apt update && sudo apt install terraform
}

if [[ $DF_IS_HOMEBREW ]]; then
  terraform_brew
elif [[ $DF_IS_APT ]]; then
  terraform_apt
fi
