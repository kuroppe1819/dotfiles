#!/bin/bash

DOTDIR="$HOME/dotfiles"
for dirName in `find $DOTDIR -maxdepth 1 -type d | grep -v "\/\."`; do
    [ $dirName = $DOTDIR ] && continue
    for fileName in `find $dirName -maxdepth 1 -type f | grep -v "install.sh"`; do
        echo $fileName
    done
done
# ln -sfnv ~/Library/Mobile\ Documents/com~apple~CloudDocs/ ~/iCloud
