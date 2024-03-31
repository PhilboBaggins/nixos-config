#!/bin/sh

set -e
set -u

cd "$(dirname -- "$0")"

sudo cp -v configuration.nix /etc/nixos/
sudo nixos-rebuild switch
