inoremap <C-e> <Esc>$a
inoremap <C-a> <Esc>^i
noremap <C-e> <Esc>$a
noremap <C-a> <Esc>^i
noremap <C-h> ^
noremap <C-l> $
" 折り返し時に表示行単位での移動できるようにする
noremap j gj
noremap k gk
" 削除時にヤンクしない(visual modeではコピーする)
nnoremap d "_d
nnoremap D "_D
nnoremap x "_x
nnoremap X "_X
