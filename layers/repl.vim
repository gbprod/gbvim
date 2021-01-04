function layers#repl#plugins() abort
  Plug 'rhysd/reply.vim', { 'on': ['Repl', 'ReplAuto'] }
endfunction

function layers#repl#bindings() abort
  let g:leader_key_map.r = { 'name': '+REPL' }
  let g:leader_key_map.r.r = 'Toggle REPL'
  nnoremap <leader>rr :Repl<CR>
  let g:leader_key_map.r.r = 'Send to REPL'
  nnoremap <leader>rs :ReplSend<Cr>
  xnoremap <leader>rs :ReplSend<Cr>
endfunction
