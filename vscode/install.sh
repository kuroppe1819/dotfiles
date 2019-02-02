#!/bin/bash
# 拡張機能リストを書き出す
# $code --list-extensions > extensions.txt

# vscodeがインストールされている場合のみ
if [ -e ~/Library/Application\ Support/Code/User ]; then
    ln -snfv settings.json ~/Library/Application\ Support/Code/User/settings.json
    
    for extension in `cat ~/dotfiles/vscode/extensions.txt`; do
        code --install-extension $extension
    done
else 
    echo "VSCodeがインストールされていません"
fi
