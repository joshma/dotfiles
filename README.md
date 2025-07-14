# Personal Dotfiles

A clean, minimal configuration for vim, zsh, git, and tmux that works across different platforms.

## Features

- **Zsh**: Modern configuration with Oh My Zsh, useful aliases, and clean prompt
- **Vim**: Lightweight setup with essential plugins and sensible defaults
- **Git**: Enhanced diff tools, useful aliases, and better formatting
- **Tmux**: Basic configuration for better terminal multiplexing

## Quick Install

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
chmod +x setup.sh
./setup.sh
```

## Manual Setup

If you prefer to install components individually:

### Prerequisites

- zsh (will be set as default shell)
- git
- vim (8.0+ recommended for plugin support)
- tmux (optional)

### Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Link Configuration Files

```bash
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
```

### Reload Configuration

```bash
source ~/.zshrc
```

## Configuration Details

### Vim
- Modern package management using vim 8+ native packages
- Airline status bar for better visual feedback
- Sensible defaults for indentation and navigation
- Language-specific configurations for Python, JavaScript, HTML, CSS

### Zsh
- Custom path configuration in `0_path.zsh`
- Useful aliases in `1_aliases.zsh`
- FZF integration for fuzzy finding
- Git integration with prompt

### Git
- Enhanced diff formatting with diff-so-fancy
- Useful aliases (lg for graph log, st for status, etc.)
- Proper color configuration
- LFS support

## Customization

- Add custom zsh configurations to `0_path.zsh` and `1_aliases.zsh`
- Vim plugins can be added to `vim/pack/*/start/` directories
- Git aliases can be customized in `gitconfig`

## Compatibility

Tested on:
- macOS
- Ubuntu/Debian Linux
- CentOS/RHEL/Fedora
- Windows Subsystem for Linux (WSL)

## Contributing

Feel free to submit issues and pull requests to improve these configurations.