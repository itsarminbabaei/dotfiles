# Dotfiles

This repository contains personal dotfiles managed with Nix flakes and home-manager for declarative configuration across macOS and NixOS.

## Philosophy

- **Declarative**: Configurations defined in code, reproducible across machines
- **Modular**: Shared and host-specific modules for easy customization
- **Simple**: One-command setup after Nix installation

## Tools Managed

- **Shell**: Fish with custom config
- **Editor**: Neovim with LazyVim
- **Terminal**: Ghostty
- **Package Manager**: Homebrew (macOS) + Nix packages
- **Tool Version Manager**: Mise
- **Nix**: For system and user configs

## Quick Setup

1. **Install Nix**: Follow https://nix.dev/install-nix (enables flakes and nix-command)
2. **Clone repo**:
   ```bash
   git clone https://github.com/itsarminbabaei/dotfiles ~/dev/dotfiles
   cd ~/dev/dotfiles
   ```
3. **Run setup**:
   ```bash
   ./init.sh
   ```

This applies configs via home-manager on macOS or nixos-rebuild on NixOS.

## Repository Structure

```
dotfiles/
├── flake.nix            # Nix flake definitions
├── flake.lock           # Flake lock file
├── init.sh              # Bootstrap script
├── macos/               # macOS-specific configs
├── nixos/               # NixOS-specific configs
├── shared/              # Common configs and modules
├── bin/                 # Utility scripts
└── README.md            # This file
```

## Development Workflow

Edit files in `~/dev/dotfiles`, then re-run `./init.sh` to apply changes.

## Troubleshooting

- Ensure Nix is installed with flakes enabled
- On NixOS, run with sudo if needed
- Check logs for errors during activation

## Notes

- macOS uses standalone home-manager
- NixOS uses system rebuild + home-manager
- Configs are symlinked via home-manager
