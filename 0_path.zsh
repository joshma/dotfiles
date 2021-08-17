export PATH=/usr/local/bin:$PATH

# Go
if [[ $CODESPACES != "true" ]]; then
  export GOPATH=$HOME/go
fi
export PATH=$PATH:$GOPATH/bin

# Ruby
export PATH="/usr/local/opt/ruby@2.6/bin:/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby@2.6/lib"
export CPPFLAGS="-I/usr/local/opt/ruby@2.6/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby@2.6/lib/pkgconfig"
