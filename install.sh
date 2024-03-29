#!/bin/sh

DOTFILES=$HOME/dotfiles

# Install diff-so-fancy
sudo git clone https://github.com/so-fancy/diff-so-fancy /usr/local/bin/diffsofancy
sudo chown -R "${whoami}:${whoami}" /usr/local/bin/diffsofancy
sudo ln -s /usr/local/bin/diffsofancy/diff-so-fancy /usr/local/bin/diff-so-fancy

# Copy configuration files
cp -r . $DOTFILES
ln -sf $DOTFILES/zshrc $HOME/.zshrc
ln -sf $DOTFILES/vim $HOME/.vim
ln -sf $DOTFILES/vimrc $HOME/.vimrc
ln -sf $DOTFILES/gitconfig $HOME/.gitconfig
ln -sf $DOTFILES/tmux.conf $HOME/.tmux.conf
