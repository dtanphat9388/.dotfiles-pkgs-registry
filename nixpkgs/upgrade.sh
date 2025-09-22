#!/bin/bash

nix-shell -p nix -I nixpkgs=channel:nixpkgs-unstable --run "nix --version"
