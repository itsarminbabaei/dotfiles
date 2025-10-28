#!/bin/bash

# Dotfiles setup script for macOS
# This script sets up a new machine with the dotfiles and tools
# Run with: curl -fsSL https://raw.githubusercontent.com/itsarminbabaei/dotfiles/main/init.sh | bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

log_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Command Line Tools
install_xcode_tools() {
    if xcode-select -p >/dev/null 2>&1; then
        log_success "Command Line Tools already installed"
        return 0
    fi

    log_info "Installing Command Line Tools..."
    xcode-select --install

    log_warning "Please complete the Command Line Tools installation in the dialog, then press Enter to continue..."
    read -r
}

# Install Homebrew
install_homebrew() {
    if command_exists brew; then
        log_success "Homebrew already installed"
        return 0
    fi

    log_info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add to PATH
    if [[ -f /opt/homebrew/bin/brew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
}

# Install packages from Brewfile
install_packages() {
    log_info "Installing packages from Brewfile..."
    brew bundle --file "${DOTFILES_DIR}/Brewfile"
}

# Install and setup mise
setup_mise() {
    if ! command_exists mise; then
        log_info "Installing mise..."
        brew install mise
    fi

    log_info "Installing tools with mise..."
    mise install
}

# Setup dotfiles with symlinks
setup_dotfiles() {
    log_info "Creating symlinks for dotfiles..."

    # Create .config if it doesn't exist
    mkdir -p "$HOME/.config"

    # Create dev directory if it doesn't exist
    mkdir -p "$HOME/dev"

    # Symlink files and directories
    ln -sf "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
    ln -sf "$DOTFILES_DIR/fish" "$HOME/.config/fish"
    ln -sf "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"
    ln -sf "$DOTFILES_DIR/mise" "$HOME/.config/mise"
    ln -sf "$DOTFILES_DIR/nix" "$HOME/.config/nix"
    ln -sf "$DOTFILES_DIR/nixvim" "$HOME/.config/nixvim"
    ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
    ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

    log_success "Symlinks created"
}

# Setup fish as default shell
setup_shell() {
    local fish_path="/opt/homebrew/bin/fish"

    if [[ "$SHELL" == "$fish_path" ]]; then
        log_success "Fish is already the default shell"
        return 0
    fi

    if ! grep -q "$fish_path" /etc/shells; then
        log_info "Adding fish to /etc/shells..."
        echo "$fish_path" | sudo tee -a /etc/shells >/dev/null
    fi

    log_info "Setting fish as default shell..."
    chsh -s "$fish_path"
}

# Main setup function
main() {
    echo -e "${BLUE}🚀 Starting dotfiles setup...${NC}"

    # Set dotfiles directory
    if [[ -z "${DOTFILES_DIR:-}" ]]; then
        DOTFILES_DIR="${HOME}/dev/dotfiles"
    fi

    # Clone dotfiles if not already present
    if [[ ! -d "$DOTFILES_DIR" ]]; then
        log_info "Cloning dotfiles repository..."
        git clone https://github.com/itsarminbabaei/dotfiles "$DOTFILES_DIR"
    fi

    cd "$DOTFILES_DIR"

    install_xcode_tools
    install_homebrew

    # Ensure brew is in PATH
    if command_exists brew; then
        eval "$(brew shellenv)"
    fi

    install_packages
    setup_mise
    setup_dotfiles
    setup_shell

    log_success "Setup complete!"
    echo -e "${GREEN}🎉 Restart your terminal or run 'exec fish' to start using fish.${NC}"
    echo -e "${BLUE}📖 Check the README for more information.${NC}"
}

# Run main function
main "$@"
