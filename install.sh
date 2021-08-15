#!/bin/sh

DOTFILES=$HOME/dotfiles

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install diff-so-fancy
git clone https://github.com/so-fancy/diff-so-fancy /usr/local/bin/diffsofancy
ln -s /usr/local/bin/diffsofancy/diff-so-fancy /usr/local/bin/diff-so-fancy

# Copy configuration files
cp -r . $DOTFILES
# ln -sf $DOTFILES/zshrc ~/.zshrc
ln -sf $DOTFILES/vim ~/.vim
ln -sf $DOTFILES/vimrc ~/.vimrc
ln -sf $DOTFILES/gitconfig ~/.gitconfig
