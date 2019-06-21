export PATH=$PATH:/usr/local/packer:/usr/local/go/bin
export PATH=$PATH:$HOME/.local/bin:$HOME/aurelia/bin
export PATH="$HOME/.yarn/bin:$PATH"
export GOPATH=$HOME/gocode
export PATH=$PATH:$GOPATH/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use  # This loads nvm
NODE_VERSION="8.11.2"
export PATH=$HOME/.nvm/versions/node/v$NODE_VERSION/bin:$PATH

export EDITOR=/usr/bin/vim
