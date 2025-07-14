# Aliases Configuration
# =====================

# Git aliases
alias g='git'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias gpl='git pull'
alias gca='git commit --amend'
alias gf='git fetch'

# Git cleanup - remove local branches that have been deleted on remote
alias gitcleanup="git fetch -p && for branch in \$(git branch -vv | grep ': gone]' | awk '{print \$1}'); do git branch -D \$branch; done"

# Docker aliases
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dimg='docker images'
alias dex='docker exec -it'
alias dlogs='docker logs'
alias dobash='docker run --rm -it --entrypoint bash'
alias dosh='docker run --rm -it --entrypoint sh'

# Kubernetes aliases (if kubectl is available)
if command -v kubectl &> /dev/null; then
    alias k='kubectl'
    alias kc='kubectl'
    alias kg='kubectl get'
    alias kd='kubectl describe'
    alias ka='kubectl apply -f'
    alias kl='kubectl logs'
    alias kex='kubectl exec -it'
fi

# System aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Modern replacements (if available)
if command -v exa &> /dev/null; then
    alias ls='exa'
    alias ll='exa -l'
    alias la='exa -la'
    alias tree='exa --tree'
fi

if command -v bat &> /dev/null; then
    alias cat='bat'
fi

if command -v fd &> /dev/null; then
    alias find='fd'
fi

# Editor aliases
alias v='vim'
alias vi='vim'
alias e='$EDITOR'

# Network and system
alias myip='curl -s ifconfig.me'
alias ports='netstat -tulanp'
alias df='df -h'
alias du='du -h'
alias free='free -h'

# Development
alias serve='python3 -m http.server'
alias jsonpp='python3 -m json.tool'
alias urlencode='python3 -c "import sys, urllib.parse as ul; print(ul.quote_plus(sys.argv[1]))"'
alias urldecode='python3 -c "import sys, urllib.parse as ul; print(ul.unquote_plus(sys.argv[1]))"'

# Reload shell configuration
alias reload='source ~/.zshrc'

# Quick directory navigation
alias dots='cd ~/.dotfiles'
alias home='cd ~'

# Process management
alias psg='ps aux | grep'
alias topcpu='ps aux --sort=-%cpu | head -10'
alias topmem='ps aux --sort=-%mem | head -10'

# Archive extraction
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
