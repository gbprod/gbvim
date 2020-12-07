function! layers#edit#plugins() abort
  Plug 'tpope/vim-surround'
  Plug 'svermeulen/vim-subversive'
  Plug 'editorconfig/editorconfig-vim'
endfunction

function! layers#edit#config() abort
  call add(g:coc_global_extensions, 'coc-pairs')

  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set expandtab
endfunction

function! layers#edit#bindings() abort
  " Save fast
  nnoremap <C-s> :<C-u>w<CR>
  vnoremap <C-s> :<C-u>w<CR>
  cnoremap <C-s> <C-u>w<CR>

  "Ctrl+Shift+Up/Down to move up and down
  nnoremap <silent><C-S-Down> :m .+1<CR>==
  nnoremap <silent><C-S-Up> :m .-2<CR>==
  inoremap <silent><C-S-Down> <Esc>:m .+1<CR>==gi
  inoremap <silent><C-S-Up> <Esc>:m .-2<CR>==gi
  vnoremap <silent><C-S-Down> :m '>+1<CR>gv=gv
  vnoremap <silent><C-S-Up> :m '<-2<CR>gv=gv

  " Use tab for indenting in visual mode
  nnoremap > >>_
  nnoremap < <<_
  inoremap <S-Tab> <C-D>
  vnoremap <Tab> >gv
  vnoremap <S-Tab> <gv

  nmap s <plug>(SubversiveSubstitute)
  nmap ss <plug>(SubversiveSubstituteLine)
  nmap S <plug>(SubversiveSubstituteToEndOfLine)
  
  let g:leader_key_map.s = {
    \ 'name': '+Substitute',
    \ 'r': 'substitute range',
    \ 'w': 'substitute word',
    \ 'R': 'substitute range with confirm',
    \ 'W': 'substitute word with confirm',
    \ }
  nmap <leader>sr <plug>(SubversiveSubstituteRange)
  xmap <leader>sr <plug>(SubversiveSubstituteRange)
  nmap <leader>sw <plug>(SubversiveSubstituteWordRange)
  nmap <leader>sR <plug>(SubversiveSubstituteRangeConfirm)
  xmap <leader>sR <plug>(SubversiveSubstituteRangeConfirm)
  nmap <leader>sW <plug>(SubversiveSubstituteWordRangeConfirm)
endfunction

