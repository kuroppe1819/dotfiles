source ~/.config/nvim/common.vim

" VSCode 専用設定
if exists('g:vscode')
  " ファイル検索
  nnoremap <leader>ff <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
  " 全文検索
  nnoremap <leader>fg <Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>
  " 分割ペイン間の移動
  nnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>
  nnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
  nnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
  nnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
  " タブ移動
  nnoremap <leader>n <Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>
  nnoremap <leader>p <Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>
  " ビジュアルモードでインデント時に選択を維持
  xnoremap > <Cmd>call VSCodeNotify('editor.action.indentLines')<CR>gv
  xnoremap < <Cmd>call VSCodeNotify('editor.action.outdentLines')<CR>gv
  " ファイル内置換（カーソル下の単語を自動挿入）
  nnoremap <leader>r viw<Cmd>call VSCodeNotify('editor.action.startFindReplaceAction')<CR>
  " ファイル保存（:w の代替）
  nnoremap <leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
  " タブを閉じる（:q の代替）
  nnoremap <leader>q <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
endif
