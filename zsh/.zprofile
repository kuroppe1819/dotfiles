#
# Executes commands at login pre-zshrc.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Homebrew
#
alias brew="env PATH=${PATH/\/Library\/Frameworks\/Python\.framework\/Versions/3\.6/bin:/} brew"

#
# Pyenv
#
if [ type pyenv > /dev/null 2>&1 ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

#
# node
#
export PATH="$HOME/.nodebrew/current/bin:$PATH"

#
# openSSL
#
export PATH=/usr/local/opt/openssl@1.1/bin:$PATH

#
# virtualenv
#
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source ~/.pyenv/shims/virtualenvwrapper.sh
fi

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="/usr/local/opt/maven@3.2/bin:$PATH"

#
# chrby
#
if [ -d /usr/local/share/chruby ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi
