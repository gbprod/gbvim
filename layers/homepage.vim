function! layers#homepage#plugins() abort
  Plug 'mhinz/vim-startify'
endfunction

function! layers#homepage#config() abort
  autocmd VimEnter * if isdirectory(expand('%:p:h')) | Startify | endif
endfunction

function! layers#homepage#bindings() abort
  nnoremap <silent><leader>as :Startify<CR>
endfunction
