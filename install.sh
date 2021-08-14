#!/bin/sh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Symlink files in
ln -sf zshrc ~/.zshrc
ln -sf vim ~/.vim
ln -sf vimrc ~/.vimrc
ln -sf gitconfig ~/.gitconfig
