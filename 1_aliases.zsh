alias kc=kubectl
alias ts="git ts"
alias gr="git res"
alias gca="git commit --amend"
alias gd="git difftool"
alias gitcleanup="git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done"

alias apdev="$GOPATH/bin/airplane --host api.airplane.so:5000"
alias apstage="airplane --host api.airstage.app"
alias dobash="docker run --rm -it --entrypoint bash"
alias dosh="docker run --rm -it --entrypoint sh"

alias dco="docker-compose --profile=db --profile=runtime-v1"
alias ap="robo --config /workspaces/robo-config/robo.yml"
