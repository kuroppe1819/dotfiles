#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Search shell command history
function select-history() {
  BUFFER=$(history -n -1000 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

# ls    
alias ls="ls -G"
alias la="ls -a"
alias ll="ls -ltr"

# docker
alias d="docker"
alias dc="docker-compose"

# git
alias g="git"
alias gb="git branch"
alias gco="git checkout"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gps="git push"
alias gpsf="git push --force-with-lease"
alias gs="git status"
alias gcp="git cherry-pick"
alias grh="git reset HEAD"
alias grhh="git reset --hard HEAD"
alias gr="git rebase"
alias glog="git log --pretty='format:%C(yellow)%h %C(green)%cd %C(reset)%s %C(red)%d %C(cyan)[%an]' --date=iso"

alias gcd() {
    cd $(git rev-parse --show-toplevel)
}
