#!/bin/sh

set -e
set -u

cd "$(dirname -- "$0")"

sudo cp -r flake.nix hosts /etc/nixos/
sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)
