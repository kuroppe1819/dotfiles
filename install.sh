#!/bin/bash
DOTDIR=$HOME/dotfiles

if !(type "brew" > /dev/null 2>&1); then
  echo "Would you please install Homebrew."
  echo "Paste that in a macOS Terminal prompt."
  echo "=> /usr/bin/ruby -e \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\""
  exit
fi

echo "Downloading Prezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Downloading dotfiles...."
git clone https://github.com/kuroppe1819/dotfiles.git $DOTDIR

# Create symbolic links
for dirPath in `find $DOTDIR -maxdepth 1 -type d | grep -v "\/\."`; do
    [ $dirPath = $DOTDIR ] && continue
    for fileName in `find $dirPath -maxdepth 1 -type f | awk -F/ '{print $NF}'`; do
        if [[ $fileName =~ ^\..* ]]; then
            ln -snfv $dirPath/$fileName ~/$fileName
        fi
    done
done
ln -sfnv ~/Library/Mobile\ Documents/com~apple~CloudDocs/ ~/iCloud
ln -snfv $DOTDIR/zsh/prompt/prompt_cpure_setup ~/.zprezto/modules/prompt/functions/prompt_cpure_setup

if [ ! -d ~/.vim ]; then
    mkdir ~/.vim
fi
ln -snfv $DOTDIR/vim/colors ~/.vim/colors

# change shell
localShellPath=/usr/local/bin/zsh
if [ -e "/usr/local/bin/zsh" ]; then
    shellsPath=/etc/shells
    if [ !`cat $shellsPath | grep $localShellPath` ]; then
        echo /usr/local/bin/zsh | sudo tee -a /etc/shells > /dev/null 2>&1
    fi
    chsh -s /usr/local/bin/zsh
else
    echo "Not found $localShellPath ."
fi
