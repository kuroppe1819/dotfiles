#!/bin/bash
DOTDIR=$HOME/dotfiles
if [ -e ~/Library/Application\ Support/Code/User ]; then
    \cp -f $DOTDIR/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    \cp -f $DOTDIR/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
    \cp -f $DOTDIR/vscode/expand-variable.code-snippets ~/Library/Application\ Support/Code/User/snippets/expand-variable.code-snippets
    for extension in `cat $DOTDIR/vscode/extensions.txt`; do
        code --install-extension $extension
    done
else 
    echo "Not found the VSCode."
fi