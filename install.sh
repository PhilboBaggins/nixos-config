#!/bin/sh

set -e  # Exit on error
set -u  # Treat unset variables as errors

cd "$(dirname -- "$0")"

sudo cp -r flake.nix hosts /etc/nixos/
sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)
