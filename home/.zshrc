# ====================
# Homebrew (起動時間短縮のため直接展開)
# ====================
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="$HOMEBREW_PREFIX/Cellar"
export HOMEBREW_REPOSITORY="$HOMEBREW_PREFIX"
fpath[1,0]="$HOMEBREW_PREFIX/share/zsh/site-functions"
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin${PATH+:$PATH}"
[[ -z "${MANPATH-}" ]] || export MANPATH=":${MANPATH#:}"
export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"

# ====================
# PATH
# ====================
export PATH="$HOME/.local/bin:$PATH"

# ====================
# Cached init (バイナリ更新時のみ再生成)
# ====================
function _cached_init() {
  local cmd=$1; shift
  local cache="$HOME/.cache/$cmd-init.zsh"
  if [[ ! -f "$cache" || "${commands[$cmd]}" -nt "$cache" ]]; then
    [[ -d "$HOME/.cache" ]] || mkdir -p "$HOME/.cache"
    "$cmd" "$@" > "$cache"
  fi
  source "$cache"
}

# ====================
# mise (runtime manager)
# ====================
_cached_init mise activate zsh

# ====================
# Completions
# ====================
fpath=($HOMEBREW_PREFIX/share/zsh-completions $fpath)
autoload -Uz compinit
if [[ -z ~/.zcompdump(#qN.mh+24) ]]; then
  compinit -C -i  # キャッシュが新鮮な場合はスキップ
else
  compinit -i     # 24h 経過した場合は再生成
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ====================
# Plugins
# ====================
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ====================
# Prompt
# ====================
_cached_init starship init zsh

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
