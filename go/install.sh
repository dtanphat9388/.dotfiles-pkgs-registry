#!/bin/bash

asdf plugin add golang
asdf install golang latest
asdf global golang latest

brew install golangci-lint
brew upgrade golangci-lint
