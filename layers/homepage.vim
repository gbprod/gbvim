function! layers#homepage#plugins() abort
  Plug 'mhinz/vim-startify'
endfunction

function! layers#homepage#config() abort
  autocmd VimEnter * if isdirectory(expand('%:p')) | Startify | endif
endfunction

function! layers#homepage#bindings() abort
  let g:leader_key_map.a.h = 'Homepage'
  nnoremap <silent><leader>ah :Startify<CR>
endfunction

