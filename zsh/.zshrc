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

# Customize to your needs...
alias ls="ls -G"
alias la="ls -a"
alias gb="git branch"
alias gs="git status"
alias gc="git checkout"
alias gcp="git cherry-pick"

