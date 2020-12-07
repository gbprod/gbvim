function! layers#tagbar#plugins() abort
  Plug 'majutsushi/tagbar'
endfunction

function! layers#tagbar#config() abort
  let g:tagbar_compact = 1
endfunction

function! layers#tagbar#bindings() abort
  nmap <F2> :TagbarToggle<CR>
endfunction
