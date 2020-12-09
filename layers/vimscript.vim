function! layers#vimscript#plugins() abort
  Plug 'syngan/vim-vimlint'
  Plug 'ynkdir/vim-vimlparser'
endfunction

function! layers#vimscript#config() abort
  call add(g:extensions, 'coc-vimlsp')
  let g:checkers['vim'] = 'vlint'

  autocmd FileType vim setlocal
    \ shiftwidth=2
    \ tabstop=2
endfunction

