export PATH=/usr/local/bin:$PATH

# Go
if [[ $CODESPACES != "true" ]]; then
  export GOPATH=$HOME/go
fi
export PATH=$PATH:$GOPATH/bin
