# dotfiles

macの設定

## 使い方
```
$curl -LSfs https://raw.githubusercontent.com/kuroppe1819/dotfiles/master/install.sh | sh
```

## BrewFileの読み込み
```
$brew bundle --file=$HOME/dotfiles/brew/Brewfile
```

## VSCodeの拡張機能リストを書き出す
```
$code --list-extensions > $HOME/dotfiles/vscode/extensions.txt
```
