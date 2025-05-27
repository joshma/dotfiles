#!/bin/sh

DOTFILES=$HOME/dotfiles

# Install diff-so-fancy
sudo git clone https://github.com/so-fancy/diff-so-fancy /usr/local/bin/diffsofancy
sudo chown -R "${whoami}:${whoami}" /usr/local/bin/diffsofancy
sudo ln -s /usr/local/bin/diffsofancy/diff-so-fancy /usr/local/bin/diff-so-fancy

# Copy configuration files
cp -r . $DOTFILES

# Create symlinks, backing up existing files
for file in zshrc vim vimrc gitconfig tmux.conf; do
  if [ -e "$HOME/.$file" ] && [ ! -L "$HOME/.$file" ]; then
    mv "$HOME/.$file" "$HOME/.$file.bak"
    echo "Backed up $HOME/.$file to $HOME/.$file.bak"
  fi
  ln -sf "$DOTFILES/$file" "$HOME/.$file"
done
