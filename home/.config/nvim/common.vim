" 行番号を表示
set number
" ヤンクをシステムのクリップボードと共有
set clipboard=unnamed
" 検索時に大文字・小文字を区別しない
set ignorecase
" 検索ワードに大文字が含まれる場合だけ区別する
set smartcase
" 検索中にリアルタイムでハイライト表示
set incsearch
" 検索結果をハイライト表示
set hlsearch
" カーソル付近に常に上下8行の余白を確保
set scrolloff=8
" インデントをスペース2つに設定
set tabstop=2
set shiftwidth=2
set expandtab

" leader キーをスペースに設定
let mapleader = " "

" 行頭・行末移動
noremap H ^
noremap L $

" 検索結果を画面中央に固定
nnoremap n nzz
nnoremap N Nzz

" 半ページスクロール時に画面中央に固定
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" 検索ハイライトを消す
nnoremap <leader>h :nohlsearch<CR>

" カーソル下の単語を一括置換（1件ずつ確認）
nnoremap <leader>r :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>

" 行を上下に移動（macOS の Option+J/K）
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" タブ移動
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprevious<CR>

" ビジュアルモードでインデント時に選択を維持
vnoremap > >gv
vnoremap < <gv

" ビジュアルモードで貼り付け時にレジスタを保持
xnoremap p "_dP

" ファイルの保存・閉じる
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" 分割ペイン間の移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
