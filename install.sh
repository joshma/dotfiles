#!/bin/sh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

DOTFILES=$HOME/dotfiles

# Copy configuration files
cp -r . $DOTFILES
ln -sf $DOTFILES/zshrc ~/.zshrc
ln -sf $DOTFILES/vim ~/.vim
ln -sf $DOTFILES/vimrc ~/.vimrc
ln -sf $DOTFILES/gitconfig ~/.gitconfig
