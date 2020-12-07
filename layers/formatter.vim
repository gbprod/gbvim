function! layers#formatter#plugins() abort
  Plug 'sbdchd/neoformat'
endfunction

function! layers#formatter#config() abort
endfunction

function! layers#formatter#bindings() abort
  let g:leader_key_map.b.f = 'Format buffer'
  nnoremap <silent><leader>bf :Neoformat<CR>
endfunction

