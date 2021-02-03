function! layers#project#config() abort
  autocmd VimEnter * if isdirectory(expand('%:p')) || 0 ==# argc() | :call <SID>load_project() | endif
  " autocmd VimLeavePre * call <SID>save_session()
endfunction

function! s:load_project() abort
  if file_readable(getcwd().'/.project.vim')
    execute 'source ' . getcwd() . '/.project.vim'
  endif

  let g:leader_key_map.p =  { 'name': '+Project' }
  for key in keys(get(g:, 'project_actions', {}))
    let g:leader_key_map.p[key] = g:project_actions[key]['name']
    execute 'nmap <silent><leader>p' . key. ' :' . g:project_actions[key]['command'] . '<CR>'
  endfor
endfunction
