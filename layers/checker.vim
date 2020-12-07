function! layers#checker#plugins() abort
  Plug 'vim-syntastic/syntastic'
endfunction

function! layers#checker#config() abort
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 0 
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  let g:syntastic_loc_list_height = 4
endfunction

function! layers#checker#bindings() abort
  let g:leader_key_map.e = { 'name': '+Errors' }

  let g:leader_key_map.e.o = 'Open'
  nnoremap <silent><leader>eo :lopen<CR>
  let g:leader_key_map.e.c = 'Close'
  nnoremap <silent><leader>ec :lclose<CR>
  let g:leader_key_map.e.n = 'Next'
  nnoremap <silent><leader>en :lnext<CR>
  let g:leader_key_map.e.N = 'Previous'
  nnoremap <silent><leader>eN :lprevious<CR>
endfunction

