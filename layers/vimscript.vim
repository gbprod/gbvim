function! layers#vimscript#plugins() abort
  Plug 'syngan/vim-vimlint'
  Plug 'ynkdir/vim-vimlparser'
  Plug 'todesking/vint-syntastic'
endfunction

function! layers#vimscript#config() abort 
  call add(g:coc_global_extensions, 'coc-vimlsp')

  autocmd FileType vim setlocal
  \ shiftwidth=2
  \ tabstop=2 
endfunction

function! layers#vimscript#bindings() abort
  
endfunction

