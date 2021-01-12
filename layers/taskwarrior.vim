function layers#taskwarrior#plugins() abort
  Plug 'farseer90718/vim-taskwarrior'
endfunction
function! layers#taskwarrior#bindings() abort
  let g:leader_key_map.a.t = "Tasks"
  nmap <silent><leader>at :TW<CR>
endfunction
