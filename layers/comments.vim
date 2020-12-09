function! layers#comments#plugins() abort
  Plug 'tpope/vim-commentary'
endfunction

function! layers#comments#bindings() abort
  let g:leader_key_map.c.l = 'Comment line'
  nmap <leader>cl <Plug>CommentaryLine
  xmap <leader>cl <Plug>Commentary

  let g:leader_key_map[';'] = 'Comment <motion>'
  omap <leader>; <Plug>Commentary
  nmap <leader>; <Plug>Commentary
  xmap <leader>; <Plug>Commentary
endfunction

