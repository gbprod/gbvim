function! layers#undotree#plugins() abort
  if has('python3')
    Plug 'simnalamburt/vim-mundo'
  else
    Plug 'mbbill/undotree'
  endif
endfunction

function! layers#undotree#config() abort
endfunction

function! layers#undotree#bindings() abort
  let g:leader_key_map.a.u = "Undo tree"
  if has('python3')
    nnoremap <silent><leader>au :MundoToggle<CR>
  else
    nnoremap <silent><leader>au :UndotreeToggle<CR>
  endif
endfunction

