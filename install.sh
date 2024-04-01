#!/bin/sh

set -e
set -u

cd "$(dirname -- "$0")"

sudo cp -v configuration.nix flake.nix home.nix /etc/nixos/
sudo nixos-rebuild switch --flake /etc/nixos#default
