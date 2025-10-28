# Dotfiles

This repository contains my personal dotfiles managed with manual symlinks.

## Philosophy

- **Idempotent**: Scripts can be run multiple times safely
- **Modular**: Easy to modify or skip individual components
- **Fast**: Minimal user interaction required
- **Error-resilient**: Handles failures gracefully
- **Documented**: Clear setup and troubleshooting

## Tools Used

- **Shell**: [fish](https://fishshell.com/) with custom config
- **Editor**: [Neovim](https://neovim.io/) with LazyVim (submodule)
- **Terminal**: [Ghostty](https://ghostty.org/)
- **Package Manager**: [Homebrew](https://brew.sh/) with Brewfile
- **Tool Version Manager**: [mise](https://mise.jdx.dev/)
- **Terminal Multiplexer**: [tmux](https://github.com/tmux/tmux)
- **Nix**: For additional configurations

## Quick Setup on a New Machine

### Option 1: Direct execution
```bash
curl -fsSL https://raw.githubusercontent.com/itsarminbabaei/dotfiles/main/init.sh | bash
```

### Option 2: Manual clone
```bash
git clone https://github.com/itsarminbabaei/dotfiles ~/dev/dotfiles
cd ~/dev/dotfiles
./init.sh
```

The script performs these phases:
1. **Bootstrap**: Install Command Line Tools and Homebrew
2. **Packages**: Install all tools from Brewfile (~90 packages)
3. **Tooling**: Set up mise and install managed tools
4. **Dotfiles**: Create symlinks from dotfiles to home directory
5. **Shell**: Set fish as default shell

## Development Workflow

On your main machine, edit files directly in `~/dev/dotfiles`. Changes are automatically reflected via symlinks.

### Adding new configurations
1. Add the file/directory to the appropriate location in `~/dev/dotfiles`
2. Create symlink: `ln -sf ~/dev/dotfiles/path/to/file ~/.path/to/file`

### Checking symlinks
```bash
ls -la ~/.config/fish  # Should show symlink to ~/dev/dotfiles/fish
```

## Repository Structure

```
dotfiles/
├── Brewfile             # Homebrew packages and casks
├── README.md            # This file
├── .gitconfig           # Git configuration (symlinked to ~/.gitconfig)
├── cursor/              # Cursor editor config
├── docker/              # Docker configs
├── docs/                # LLM setup and documentation
├── fish/                # Fish shell config (symlinked to ~/.config/fish/)
├── ghostty/             # Ghostty config (symlinked to ~/.config/ghostty/)
├── init.sh              # Bootstrap script
├── mise/                # Mise config (symlinked to ~/.config/mise/)
├── nix/                 # Nix config (symlinked to ~/.config/nix/)
├── nixvim/              # Nixvim config (symlinked to ~/.config/nixvim/)
├── nvim/                # Neovim config (submodule, symlinked to ~/.config/nvim/)
├── raycast/             # Raycast launcher config
├── tmux/                # Tmux config
│   └── .tmux.conf       # Tmux config (symlinked to ~/.tmux.conf)
└── zed/                 # Zed editor config
```

## Troubleshooting

### Command Line Tools installation stuck
If `xcode-select --install` doesn't prompt, run:
```bash
sudo rm -rf /Library/Developer/CommandLineTools
xcode-select --install
```

### Homebrew installation fails
Check internet connection and try again. If issues persist, install manually.

### Chezmoi conflicts
If you have existing configs, backup and remove them before running init.sh.

### Fish shell not working
Ensure `/opt/homebrew/bin/fish` is in `/etc/shells` and run `chsh -s /opt/homebrew/bin/fish`.

## Testing

Test the setup in a fresh environment:
- Use a macOS VM
- Use GitHub Codespaces (limited macOS support)
- Use Docker with macOS emulation (experimental)

## Future Improvements

- Add `.chezmoiscripts` for run-once setup tasks
- Implement dependency checking
- Add rollback capabilities
- Support multiple OS (Linux, Windows)
- Add configuration profiles

## Notes

- Neovim config is a git submodule from [itsarminbabaei/nvim](https://github.com/itsarminbabaei/nvim)
- Nixvim config is in `nixvim/` - experiment with `cd nixvim && nix run .` (separate from LazyVim)
- Update submodules: `git submodule update --init --recursive`
- Brewfile includes development tools, languages, and applications
