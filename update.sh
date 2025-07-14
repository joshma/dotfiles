#!/bin/bash

# Dotfiles Update Script
# ======================
# Updates dotfiles and common development tools

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_status() {
    echo -e "${BLUE}[UPDATE]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_status "Starting dotfiles update..."

# Update the dotfiles repository
if [[ -d ".git" ]]; then
    print_status "Updating dotfiles repository..."
    git pull origin main 2>/dev/null || git pull origin master 2>/dev/null || print_warning "Could not update git repository"
    print_success "Dotfiles repository updated"
fi

# Update Oh My Zsh
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    print_status "Updating Oh My Zsh..."
    (cd "$HOME/.oh-my-zsh" && git pull) || print_warning "Could not update Oh My Zsh"
    print_success "Oh My Zsh updated"
fi

# Update vim packages
if [[ -d "$HOME/.vim/pack" ]]; then
    print_status "Updating Vim packages..."
    find "$HOME/.vim/pack" -type d -name ".git" | while read -r gitdir; do
        plugindir=$(dirname "$gitdir")
        pluginname=$(basename "$plugindir")
        print_status "Updating vim plugin: $pluginname"
        (cd "$plugindir" && git pull) || print_warning "Could not update $pluginname"
    done
    print_success "Vim packages updated"
fi

# Update package managers
update_package_manager() {
    local cmd="$1"
    local name="$2"
    
    if command -v "$cmd" &> /dev/null; then
        print_status "Updating $name packages..."
        case "$cmd" in
            "brew")
                brew update && brew upgrade
                ;;
            "apt")
                sudo apt update && sudo apt upgrade -y
                ;;
            "yum")
                sudo yum update -y
                ;;
            "dnf")
                sudo dnf update -y
                ;;
            "pacman")
                sudo pacman -Syu --noconfirm
                ;;
        esac
        print_success "$name packages updated"
    fi
}

# Update system packages based on platform
case "$(uname -s)" in
    Darwin*)
        update_package_manager "brew" "Homebrew"
        ;;
    Linux*)
        if command -v apt &> /dev/null; then
            update_package_manager "apt" "APT"
        elif command -v yum &> /dev/null; then
            update_package_manager "yum" "YUM"
        elif command -v dnf &> /dev/null; then
            update_package_manager "dnf" "DNF"
        elif command -v pacman &> /dev/null; then
            update_package_manager "pacman" "Pacman"
        fi
        ;;
esac

# Update Node.js packages
if command -v npm &> /dev/null; then
    print_status "Updating global npm packages..."
    npm update -g || print_warning "Could not update npm packages"
    print_success "Global npm packages updated"
fi

# Update Python packages
if command -v pip3 &> /dev/null; then
    print_status "Updating pip packages..."
    pip3 list --outdated --format=freeze | cut -d = -f 1 | xargs -n1 pip3 install -U 2>/dev/null || print_warning "Could not update pip packages"
    print_success "Pip packages updated"
fi

# Update Rust packages
if command -v cargo &> /dev/null; then
    print_status "Updating Rust toolchain..."
    rustup update || print_warning "Could not update Rust"
    print_success "Rust toolchain updated"
fi

print_success "Dotfiles update complete! 🎉"
print_status "Consider restarting your terminal or running: source ~/.zshrc"