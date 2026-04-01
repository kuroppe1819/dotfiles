# ====================
# Homebrew
# ====================
eval $(/opt/homebrew/bin/brew shellenv)

# ====================
# PATH
# ====================
export PATH="$HOME/.local/bin:$PATH"

# ====================
# mise (runtime manager)
# ====================
eval "$(mise activate zsh)"

# ====================
# Completions
# ====================
fpath=($(brew --prefix)/share/zsh-completions $fpath)
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ====================
# Plugins
# ====================
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ====================
# Prompt
# ====================
eval "$(starship init zsh)"

# ====================
# fzf
# ====================
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# Search command history
function history-fzf() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="> ")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N history-fzf
bindkey '^r' history-fzf

# Switch git branch (including remote branches)
branch-fzf() {
  local branch
  branch=$(git branch -a | tr -d " " | grep -v "HEAD" | fzf --height 60% --prompt ">" --preview "git log --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g")
  if [[ -n "$branch" ]]; then
    BUFFER="git switch $branch"
    zle accept-line
  fi
  zle redisplay
}
zle -N branch-fzf
bindkey '^b' branch-fzf

# ====================
# Aliases
# ====================
alias ls="ls -G"
alias la="ls -a"
alias gpsf="git push --force-with-lease"
alias sed="gsed"
alias npx='echo "WARNING: npx is disabled. Use pnpm exec instead." && false'
alias npm='echo "WARNING: npm is disabled. Use pnpm instead." && false'
alias gcb='git rev-parse --abbrev-ref HEAD | tr -d "\n" | pbcopy && echo "Copied: $(git rev-parse --abbrev-ref HEAD)"'
alias vim="nvim"

# ====================
# Local overrides (not tracked in dotfiles)
# ====================
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
