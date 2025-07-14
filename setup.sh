#!/bin/bash

# Dotfiles Setup Script
# Sets up a clean development environment with vim, zsh, git, and tmux configurations

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
print_status "Dotfiles directory: $DOTFILES_DIR"

# Function to backup existing files
backup_file() {
    local file="$1"
    if [[ -f "$file" || -L "$file" ]]; then
        local backup="${file}.backup.$(date +%Y%m%d_%H%M%S)"
        print_warning "Backing up existing $file to $backup"
        mv "$file" "$backup"
    fi
}

# Function to create symlinks
create_symlink() {
    local source="$1"
    local target="$2"
    
    if [[ -f "$source" ]]; then
        backup_file "$target"
        ln -sf "$source" "$target"
        print_success "Linked $source -> $target"
    else
        print_warning "Source file $source not found, skipping"
    fi
}

print_status "Starting dotfiles setup..."

# Check if zsh is installed
if ! command -v zsh &> /dev/null; then
    print_error "zsh is not installed. Please install it first:"
    print_error "  Ubuntu/Debian: sudo apt update && sudo apt install zsh"
    print_error "  CentOS/RHEL/Fedora: sudo yum install zsh (or dnf install zsh)"
    print_error "  macOS: brew install zsh (zsh is usually pre-installed)"
    exit 1
fi

# Install Oh My Zsh if not already installed
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    print_status "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    print_success "Oh My Zsh installed"
else
    print_status "Oh My Zsh already installed"
fi

# Install diff-so-fancy for better git diffs
if ! command -v diff-so-fancy &> /dev/null; then
    print_status "Installing diff-so-fancy..."
    if command -v npm &> /dev/null; then
        npm install -g diff-so-fancy
        print_success "diff-so-fancy installed via npm"
    elif command -v brew &> /dev/null; then
        brew install diff-so-fancy
        print_success "diff-so-fancy installed via homebrew"
    else
        print_warning "diff-so-fancy not installed. Install manually with:"
        print_warning "  npm install -g diff-so-fancy"
        print_warning "  or download from: https://github.com/so-fancy/diff-so-fancy"
    fi
else
    print_status "diff-so-fancy already installed"
fi

# Create symlinks for configuration files
print_status "Creating symlinks for configuration files..."

create_symlink "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES_DIR/vimrc" "$HOME/.vimrc"
create_symlink "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES_DIR/tmux.conf" "$HOME/.tmux.conf"

# Handle vim directory
if [[ -d "$DOTFILES_DIR/vim" ]]; then
    backup_file "$HOME/.vim"
    ln -sf "$DOTFILES_DIR/vim" "$HOME/.vim"
    print_success "Linked vim directory"
fi

# Set zsh as default shell if it's not already
if [[ "$SHELL" != "$(which zsh)" ]]; then
    print_status "Setting zsh as default shell..."
    if command -v chsh &> /dev/null; then
        chsh -s "$(which zsh)"
        print_success "Default shell changed to zsh (restart terminal to take effect)"
    else
        print_warning "chsh not available. Manually set zsh as your default shell"
    fi
else
    print_status "zsh is already the default shell"
fi

print_success "Dotfiles setup complete!"
print_status "Please restart your terminal or run: source ~/.zshrc"

# Check for common dependencies
print_status "Checking for recommended tools..."
tools=("fzf" "tmux" "git")
for tool in "${tools[@]}"; do
    if command -v "$tool" &> /dev/null; then
        print_success "$tool is installed"
    else
        print_warning "$tool is not installed (recommended)"
    fi
done

print_status "Setup complete! 🎉"