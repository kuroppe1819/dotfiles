source ~/.config/nvim/common.vim

" 通常のNeovimでのみプラグインとカラースキームを読み込む
if !exists('g:vscode')
  lua << EOF
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  -- プラグイン管理ツールが未導入の場合のみ取得する
  if not vim.uv.fs_stat(lazypath) then
    local result = vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })

    if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
        { "lazy.nvimの取得に失敗しました:\n", "ErrorMsg" },
        { result, "WarningMsg" },
      }, true, {})
      return
    end
  end

  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({
    {
      "catppuccin/nvim",
      name = "catppuccin",
      lazy = false,
      priority = 1000,
      opts = {},
      config = function()
        vim.cmd.colorscheme("catppuccin-nvim")
      end,
    },
  })
EOF
endif

" VSCode 専用設定
if exists('g:vscode')
  " 定義先へジャンプ
  nnoremap gd <Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>
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
