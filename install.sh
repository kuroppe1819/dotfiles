#!/bin/bash
DOTDIR=$HOME/dotfiles

# Install package manager
if [ !type "brew" > /dev/null 2>&1 ]; then
  echo "Installing HomeBrew...."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install packages
brew install zsh zsh-completions git fzf
brew cask install visual-studio-code

echo "Downloading Prezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo "Downloading dotfiles...."
git clone https://github.com/kuroppe1819/dotfiles.git $HOME/dotfiles

# Create symbolic links
for dirPath in `find $DOTDIR -maxdepth 1 -type d | grep -v "\/\."`; do
    [ $dirPath = $DOTDIR ] && continue
    [ $dirPath = $DOTDIR/vscode ] && continue
    for fileName in `find $dirPath -maxdepth 1 -type f | awk -F/ '{print $NF}'`; do
        ln -snfv $dirPath/$fileName ~/$fileName
    done
done
ln -snfv ~/dotfiles/vim/colors ~/.vim/colors
ln -sfnv ~/Library/Mobile\ Documents/com~apple~CloudDocs/ ~/iCloud
ln -snfv ~/dotfiles/zsh/prompt/prompt_cpure_setup ~/.zprezto/modules/prompt/functions/prompt_cpure_setup
git config --global core.excludesfile ~/.gitignore_global

# VSCode settings
if [ -e ~/Library/Application\ Support/Code/User ]; then
    ln -snfv settings.json ~/Library/Application\ Support/Code/User/settings.json
    for extension in `cat ~/dotfiles/vscode/extensions.txt`; do
        code --install-extension $extension
    done
else 
    echo "Not found the VSCode"
fi

# change shell
shellsPath=/etc/shells
localShellPath=/usr/local/bin/zsh
if [ !`cat $shellsPath | grep $localShellPath` ]; then
    echo /usr/local/bin/zsh | sudo tee -a /etc/shells > /dev/null 2>&1
fi
chsh -s /usr/local/bin/zsh
