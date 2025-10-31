#!/bin/bash
set -e

# Run in nix develop with required tools (enable experimental features)
nix --extra-experimental-features nix-command --extra-experimental-features flakes develop --command nix run github:nix-community/home-manager -- switch --flake .#macos
