function! layers#ui#plugins() abort
  Plug 'arcticicestudio/nord-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'moll/vim-bbye'
  Plug 'arithran/vim-delete-hidden-buffers'
  Plug 'liuchengxu/vim-which-key'
  Plug 'yggdroot/indentline'
endfunction

function! layers#ui#config() abort
  colorscheme nord

  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = ' '
  let g:airline#extensions#tabline#formatter = 'unique_tail'

  set timeoutlen=300
  
  let g:mapleader = "\<Space>"
  let g:maplocalleader = ','

  let g:leader_key_map = {
  \ 'a': { 'name': "+Applications" },
  \ 'b': { 'name': "+Buffers" },
  \ 'f': { 'name': "+Files" },
  \ 'w': { 'name': "+Windows" },
  \ 's': { 'name': '+Search/Substitute' },
  \ }

  let g:localleader_key_map = {}
  let g:g_key_map = {}

  call which_key#register('<Space>', "g:leader_key_map")
  call which_key#register(',', "g:localleader_key_map")
  
  nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
  nnoremap <silent><localleader> :<c-u>WhichKey ','<CR>
  vnoremap <silent><leader> :<c-u>WhichKeyVisual '<Space>'<CR>
  vnoremap <silent><localleader> :<c-u>WhichKeyVisual ','<CR>

  highlight default link WhichKeySeperator Identifier
  
  let g:indentLine_char = '┊'
  let g:indentLine_concealcursor = 'niv'
  let g:indentLine_conceallevel = 2
endfunction


function! layers#ui#bindings() abort
  nnoremap <silent><C-Right> :<C-u>wincmd l<CR>
  nnoremap <silent><C-Left>  :<C-u>wincmd h<CR>
  nnoremap <silent><C-Up>    :<C-u>wincmd k<CR>
  nnoremap <silent><C-Down>  :<C-u>wincmd j<CR>

  nnoremap <silent><A-Right> :bnext<CR>
  nnoremap <silent><A-Left> :bprev<CR>
  
  let g:leader_key_map.b.d = 'Close current'
  nnoremap <silent><leader>bd :Bdelete<CR>
  let g:leader_key_map.b.c = 'Clear others'
  nnoremap <silent><leader>bc :DeleteHiddenBuffers<cr>
  let g:leader_key_map.b.C = 'Close all'
  nnoremap <silent><leader>bC :bufdo :Bdelete<CR>
 
  let g:leader_key_map.w['='] = 'Balance'
  nnoremap <silent><leader>w= :wincmd =<CR>

  let g:leader_key_map.w.v = 'Vertical split'
  nnoremap <silent><leader>wv :vsplit<CR>
  let g:leader_key_map.w.h = 'Horizontal split'
  nnoremap <silent><leader>wh :split<CR>
  let g:leader_key_map.w.d = 'Delete'
  nnoremap <silent><leader>wd :close<CR>
endfunction

