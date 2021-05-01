#
# Executes commands at the start of an interactive session.
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Zsh default options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Search shell command history
function history-fzf() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N history-fzf
bindkey '^r' history-fzf

# fbr - checkout git branch (including remote branches)
git-branch-fzf() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux --prompt="Branch > " -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  zle accept-line
}
zle -N git-branch-fzf
bindkey '^g' git-branch-fzf

# fzf wiki https://github.com/junegunn/fzf/wiki/examples
# fd - cd to selected directory
change-directory-fzf() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf --prompt="Directory > " --query "$LBUFFER" +m) &&
  cd "$dir"
  zle accept-line
}
zle -N change-directory-fzf 
bindkey '^f' change-directory-fzf 

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
alias gbd-merged="git branch --merged|egrep -v '(develop|master)'|xargs git branch -D"
alias sed="gsed"
