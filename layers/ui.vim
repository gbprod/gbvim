function! layers#ui#plugins() abort
  Plug 'arcticicestudio/nord-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'moll/vim-bbye'
  Plug 'arithran/vim-delete-hidden-buffers'
  Plug 'liuchengxu/vim-which-key'
  Plug 'yggdroot/indentline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/goyo.vim'

  let g:language_specified_mappings = {}
endfunction

function! layers#ui#config() abort
  colorscheme nord
  call add(g:extensions, 'coc-highlight')
  call add(g:extensions, 'coc-bookmark')

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
    \ 's': { 'name': '+Search' },
    \ 'x': { 'name': '+String' },
    \ 'm': { 'name': '+Marks' },
    \ }

  autocmd BufEnter * call s:change_lspc_bindings()

  call which_key#register('<Space>', "g:leader_key_map")
  call which_key#register(',', "g:localleader_key_map")

  nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
  vnoremap <silent><leader> :<c-u>WhichKeyVisual '<Space>'<CR>

  highlight default link WhichKeySeperator Identifier

  let g:indentLine_char = '┊'
  let g:indentLine_concealcursor = 'niv'
  let g:indentLine_conceallevel = 2

  let g:goyo_width = 120
endfunction

function! layers#ui#bindings() abort
  nnoremap <silent><C-Right> :<C-u>wincmd l<CR>
  nnoremap <silent><C-Left> :<C-u>wincmd h<CR>
  nnoremap <silent><C-Up> :<C-u>wincmd k<CR>
  nnoremap <silent><C-Down> :<C-u>wincmd j<CR>

  nnoremap <silent><A-Right> :call <SID>change_tab('next')<CR>
  nnoremap <silent><A-Left> :call <SID>change_tab('prev')<CR>
  nnoremap <silent><leader><tab> :call <SID>change_tab('#')<CR>

  let g:leader_key_map.b.d = 'Close current'
  nnoremap <silent><leader>bd :Bdelete<CR>
  let g:leader_key_map.b.c = 'Clear others'
  nnoremap <silent><leader>bc :DeleteHiddenBuffers<cr>
  let g:leader_key_map.b.C = 'Close all'
  nnoremap <silent><leader>bC :bufdo :Bdelete<CR>
  let g:leader_key_map.b.e = 'New empty'
  nnoremap <silent><leader>be :enew<CR>

  let g:leader_key_map.w['='] = 'Balance'
  nnoremap <silent><leader>w= :wincmd =<CR>
  nnoremap <silent> <leader>w<Up> :resize +5<CR>
  nnoremap <silent> <leader>w<Down> :resize -5<CR>
  nnoremap <silent> <leader>w<Right> :vertical resize +5<CR>
  nnoremap <silent> <leader>w<Left> :vertical resize -5<CR>

  let g:leader_key_map.w.v = 'Vertical split'
  nnoremap <silent><leader>wv :vsplit<CR>
  let g:leader_key_map.w.h = 'Horizontal split'
  nnoremap <silent><leader>wh :split<CR>
  let g:leader_key_map.w.d = 'Delete'
  nnoremap <silent><leader>wd :close<CR>

  let g:leader_key_map.a.C = 'Color picker'
  nnoremap <silent><leader>aC :call CocAction('pickColor')<CR>

  let g:leader_key_map.m.m = 'Toggle'
  nmap <silent> <leader>mm <Plug>(coc-bookmark-toggle)
  let g:leader_key_map.m.a = 'Show all'
  nmap <silent> <leader>ma :CocList bookmark<CR>
  let g:leader_key_map.m.n = 'Next'
  nmap <silent> <leader>mn <Plug>(coc-bookmark-next)
  let g:leader_key_map.m.N = 'Previous'
  nmap <silent> <leader>mN <Plug>(coc-bookmark-prev)
  let g:leader_key_map.m.c = 'Clear for file'
  nmap <silent> <leader>mc :CocCommand bookmark.clearForCurrentFile<CR>
  let g:leader_key_map.m.C = 'Clear all'
  nmap <silent> <leader>mC :CocCommand bookmark.clearForAllFiles<CR>

  let g:leader_key_map.a.d = "Distraction free"
  nmap <silent> <leader>ad :Goyo<CR>
endfunction

function! s:change_lspc_bindings() abort
  if !empty(&filetype) && has_key(g:language_specified_mappings, &filetype)
    let g:leader_key_map.l = { 'name': '+Language-specified' }
    call call(g:language_specified_mappings[&filetype], [])
  else
    let g:leader_key_map.l = 'which_key_ignore'
  endif
endfunction

function s:change_tab(target) abort
  if &filetype ==# "defx"
    wincmd p
  endif

  execute 'b'.a:target
endfunction
