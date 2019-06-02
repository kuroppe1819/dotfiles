#!/bin/bash

DOTDIR="$HOME/dotfiles"
for dirName in `find $DOTDIR -maxdepth 1 -type d | grep -v "\/\."`; do
    [ $dirName = $DOTDIR ] && continue
    echo $dirName
done
# ln -sfnv ~/Library/Mobile\ Documents/com~apple~CloudDocs/ ~/iCloud
