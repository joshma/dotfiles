# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git virtualenv)
setopt PRINT_EXIT_VALUE

source $ZSH/oh-my-zsh.sh

source /usr/local/etc/bash_completion.d/git-prompt.sh
setopt PROMPT_SUBST
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
PS1='%* %{%F{green}%}%n@%m%f %3c%{%F{blue}%}$(__git_ps1 " (%s)")%f'
PS1="$PS1"$'\n'"[${AWS_VAULT}] \$ "

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias wo="workon aurelia && cd ~/aurelia"
alias kdiff="git difftool -y -t Kaleidoscope"

alias releases="git log origin/master^..origin/master --pretty=format:\"%h - %an, %s\""
function ao {
  aws-okta exec prod-ops -- "${@:1}"
}
function ae {
  aws-vault exec --assume-role-ttl=60m $1 -- "${@:2}"
}
function aeow {
  ae ops-us-west-2 "${@}"
}
function aeox {
  ae testext "${@}"
}
function tfsec {
  TF_CLI_ARGS=-var-file=/Users/josh/aurelia/infra/terraform/.env_secrets.tfvars "${@}"
}

export AURELIA_ENABLE_DOCKER_FOR_MAC=true
source $HOME/.benchling-dotfiles/.zshrc.benchling
source $HOME/.envs/aurelia/bin/activate

# The next line updates PATH for the Google Cloud SDK.
# source '/usr/local/google-cloud-sdk/path.zsh.inc'
# The next line enables shell command completion for gcloud.
# source '/usr/local/google-cloud-sdk/completion.zsh.inc'

function uuid {
  python -c "import uuid; print str(uuid.uuid4())"
}
__git_files () { 
  _wanted files expl 'local files' _files     
}
fpath=( /usr/local/Cellar/ripgrep/0.6.0/share/zsh/site-functions/ "${fpath[@]}" )
function https() {
    openssl s_client -connect $1:443 -servername $1 < /dev/null | \
    openssl x509 -noout -text -certopt no_header,no_version,no_serial,no_signame,no_pubkey,no_sigdump
}

export GPG_TTY=$(tty)

alias git=hub

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/josh/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# aws autocomplete setup
source $HOME/.envs/aurelia/bin/aws_zsh_completer.sh

