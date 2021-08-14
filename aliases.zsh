alias kc=kubectl
alias ts="git ts"
alias gr="git res"
alias gca="git commit --amend"
alias gd="git difftool"
alias gitcleanup="git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done"

alias kcdev="kubectl config use-context kind-airplane"
alias kcprod="kubectl config use-context gke_airplane-prod_us-central1-c_cluster-airplane"
alias kpt="kc -n prod-tasks"
alias kst="kc -n stage-tasks"
alias apdevbuild="go run ./cmd/airplane/ --host api.airplane.so:5000"
alias apdev="$GOPATH/bin/airplane --host api.airplane.so:5000"
alias apstage="airplane --host api.airstage.app"
alias dobash="docker run --rm -it --entrypoint bash"
alias dosh="docker run --rm -it --entrypoint sh"