function! layers#git#plugins() abort
  Plug 'airblade/vim-gitgutter'
endfunction

function! layers#git#config() abort
  autocmd Filetype gitcommit set nocindent
endfunction

function! layers#git#bindings() abort
endfunction
