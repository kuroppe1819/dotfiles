#!/bin/bash

DOTDIR=$HOME/dotfiles

for dirPath in `find $DOTDIR -maxdepth 1 -type d | grep -v "\/\."`; do
    [ $dirPath = $DOTDIR ] && continue
    [ $dirPath = $DOTDIR/vscode ] && continue
    for fileName in `find $dirPath -maxdepth 1 -type f | grep -v "install.sh" | awk -F/ '{print $NF}'`; do
        ln -snfv "$dirPath/$fileName" "$HOME/$fileName"
    done
done
# ln -sfnv ~/Library/Mobile\ Documents/com~apple~CloudDocs/ ~/iCloud
