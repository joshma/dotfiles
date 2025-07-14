# Path Configuration
# ==================

# Ensure /usr/local/bin is in PATH
export PATH="/usr/local/bin:$PATH"

# Go configuration
if [[ $CODESPACES != "true" ]]; then
    export GOPATH="${HOME}/go"
    export PATH="${PATH}:${GOPATH}/bin"
fi

# Rust/Cargo
if [[ -d "${HOME}/.cargo/bin" ]]; then
    export PATH="${HOME}/.cargo/bin:${PATH}"
fi

# Python user binaries
if [[ -d "${HOME}/.local/bin" ]]; then
    export PATH="${HOME}/.local/bin:${PATH}"
fi

# Ruby (using rbenv if available, otherwise system Ruby)
if command -v rbenv &> /dev/null; then
    eval "$(rbenv init -)"
elif [[ -d "/opt/homebrew/opt/ruby/bin" ]]; then
    # Homebrew Ruby on Apple Silicon
    export PATH="/opt/homebrew/opt/ruby/bin:${PATH}"
    export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
    export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
    export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
elif [[ -d "/usr/local/opt/ruby/bin" ]]; then
    # Homebrew Ruby on Intel Mac
    export PATH="/usr/local/opt/ruby/bin:${PATH}"
    export LDFLAGS="-L/usr/local/opt/ruby/lib"
    export CPPFLAGS="-I/usr/local/opt/ruby/include"
    export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
fi

# Homebrew (Apple Silicon)
if [[ -d "/opt/homebrew/bin" ]]; then
    export PATH="/opt/homebrew/bin:${PATH}"
fi

# Snap packages (Linux)
if [[ -d "/snap/bin" ]]; then
    export PATH="/snap/bin:${PATH}"
fi

# Local bin directory
if [[ -d "${HOME}/bin" ]]; then
    export PATH="${HOME}/bin:${PATH}"
fi
