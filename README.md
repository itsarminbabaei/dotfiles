# Blueprint

Nix flake for macOS (darwin) and NixOS configurations with home-manager integration. Shares reusable modules across systems.

## Structure

- `hosts/` - System-specific configurations (darwin, nixos)
- `modules/home/` - Shared home-manager modules
  - `programs/` - Program configurations (neovim, fish, git, starship, ghostty, etc.)
  - `home-shared.nix` - Common home-manager settings
- `flake.nix` - Flake inputs and outputs
- `cz.json` - Commitizen config

## Features

### Neovim (nixvim)

Complete neovim setup with:
- LSP configuration and Mason package manager
- Completion (blink-cmp)
- Formatting (conform)
- Linting (nvim-lint)
- Git integration (gitsigns, lazygit, diffview)
- Fuzzy finding (telescope)
- File navigation (oil, harpoon)
- Debugging (DAP with go support)
- AI tools (avante, sidekick)
- Enhanced UI (noice, which-key, trouble)
- Status bar (lualine)
- Tree-sitter integration and context
- Testing (neotest)

### Shell & Tools

- Fish shell with aliases and Salvage Denim theme
- Starship prompt with git integration
- Ghostty terminal with custom keybinds
- Git with commitizen hooks and LFS
- CLI utilities: fzf, fd, bat, eza, btop, jq, zoxide, yazi
- Tmux, zellij for terminal multiplexing
- LazyGit, LazyDocker for version control and containers
- AI tools: amp, catnip, claude-code, forge, gemini-cli, goose-cli, qwen-code, droid

### Package Management

- Home-manager for user environment
- Mason for neovim language servers
- Nix flakes for reproducible builds

## Installation

```bash
git clone https://github.com/yourusername/blueprint.git
cd blueprint
darwin-rebuild switch --flake .#darwin
# or for NixOS:
nixos-rebuild switch --flake .#nixos
```

## Usage

Edit `hosts/darwin/darwin-configuration.nix` for macOS-specific settings.
Edit `modules/home/home-shared.nix` for common configurations.
Add new program configs in `modules/home/programs/`.

## License

MIT
