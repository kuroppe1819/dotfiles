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
  BUFFER=$(history -n -1000 | fzf --no-sort +m --query "^$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history
export FZF_DEFAULT_OPTS='--reverse --border'

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

gcd() {
    cd $(git rev-parse --show-toplevel)
}

# fzf wiki https://github.com/junegunn/fzf/wiki/examples
# fd - cd to selected directory
cdf() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fbr - checkout git branch (including remote branches)
gcof() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

