function! layers#search#plugins() abort
  Plug 'dyng/ctrlsf.vim'
endfunction

function! layers#search#config() abort
  let g:ctrlsf_default_view_mode = 'normal'
  let g:ctrlsf_case_sensitive = 'no'
  let g:ctrlsf_position = 'right'
  if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
  endif
endfunction

function! layers#search#bindings() abort
  let g:leader_key_map.f.f = 'Prompt search'
  nmap <leader>ff <Plug>CtrlSFPrompt
  let g:leader_key_map.f.v = 'Prompt search <visual>'
  vmap <leader>fv <Plug>CtrlSFVwordPath
  let g:leader_key_map.f.w = 'Prompt search <cword>'
  nmap <leader>fw <Plug>CtrlSFCwordPath
  let g:leader_key_map.f['/'] = 'Prompt search <lastsearch>'
  nmap <leader>f/ <Plug>CtrlSFPwordPath
  let g:leader_key_map.f.t = 'Toggle search'
  nnoremap <leader>ft :CtrlSFToggle<CR>
endfunction

