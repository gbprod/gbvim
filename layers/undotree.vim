function! layers#undotree#plugins() abort
  Plug 'simnalamburt/vim-mundo'
endfunction

function! layers#undotree#config() abort
endfunction

function! layers#undotree#bindings() abort
  let g:leader_key_map.a.u = "Undo tree"
  nnoremap <silent><leader>au :MundoToggle<CR>
endfunction

