function! layers#comments#plugins() abort
  Plug 'tpope/vim-commentary'
endfunction

function! layers#comments#bindings() abort
  let g:leader_key_map.c.l = 'Comment line'
  nmap <leader>cl <Plug>CommentaryLinej
  xmap <leader>cl <Plug>Commentary

  let g:leader_key_map.c.c = 'Comment <motion>'
  omap <leader>cc <Plug>Commentary
  nmap <leader>cc <Plug>Commentary
  xmap <leader>cc <Plug>Commentary
endfunction

