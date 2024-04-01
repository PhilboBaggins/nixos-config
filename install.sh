#!/bin/sh

set -e  # Exit on error
set -u  # Treat unset variables as errors

cd "$(dirname -- "$0")"

sudo nixos-rebuild switch --flake .#$(hostname)
