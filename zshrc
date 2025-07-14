# Modern Zsh Configuration
# ========================

# Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
export DOTFILES="$HOME/.dotfiles"

# Theme
ZSH_THEME="af-magic"

# Plugins
plugins=(
    git
    fzf
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Oh My Zsh settings
ZSH_CUSTOM="$DOTFILES"
DISABLE_AUTO_UPDATE="true"  # We'll update manually
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# User Configuration
# ==================

# Editor
export EDITOR=vim
export VISUAL=vim

# History
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# Performance and limits
ulimit -n 10000

# Custom prompt
PS1='$FG[032]%~$(git_prompt_info)$(hg_prompt_info)
${return_code} $FG[105]%(!.#.»)%{$reset_color%} '
unset RPS1

# Tool Integration
# ================

# FZF (fuzzy finder)
if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
    export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
fi

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
if [[ -s "$NVM_DIR/nvm.sh" ]]; then
    source "$NVM_DIR/nvm.sh"
    source "$NVM_DIR/bash_completion"
fi

# Conda (if installed)
if [[ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]]; then
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
elif [[ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]]; then
    source "$HOME/anaconda3/etc/profile.d/conda.sh"
fi

# Platform-specific configurations
case "$(uname -s)" in
    Darwin*)
        # macOS specific
        export BROWSER='open'
        ;;
    Linux*)
        # Linux specific
        export BROWSER='xdg-open'
        ;;
    CYGWIN*|MINGW32*|MSYS*|MINGW*)
        # Windows specific
        export BROWSER='start'
        ;;
esac

# iTerm2 integration (macOS only)
if [[ "$OSTYPE" == "darwin"* ]] && [[ -e "${HOME}/.iterm2_shell_integration.zsh" ]]; then
    source "${HOME}/.iterm2_shell_integration.zsh"
    
    function iterm2_print_user_vars() {
        # Show kubernetes context if kubectl is available
        if command -v kubectl &> /dev/null; then
            iterm2_set_user_var kubecontext $(kubectl config current-context 2>/dev/null || echo "none")
            iterm2_set_user_var kubens $(kubectl config view -o "jsonpath={.contexts[?(@.name==\"$(kubectl config current-context)\")].context.namespace}" 2>/dev/null || echo "default")
        fi
    }
fi

# Load custom configurations
# ==========================

# Load all custom zsh files in dotfiles directory
for file in "$DOTFILES"/*.zsh; do
    [[ -r "$file" ]] && source "$file"
done

# Load local customizations (not tracked in git)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
