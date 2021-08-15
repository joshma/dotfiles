export PATH=/usr/local/bin:$PATH

# Go
if [[ $CODESPACES == "true" ]]; then
  export GOPATH=/go
else
  export GOPATH=$HOME/go
fi
export PATH=$PATH:$GOPATH/bin

# This doesn't work but leaving it around.
export PATH="$PATH:/Users/josh/Code/istio-1.8.0/bin"
