function! layers#search#config() abort
  call add(g:extensions, 'coc-lists')

  if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
  endif

  call coc#config('refactor', {
    \ 'openCommand': 'rightbelow vsplit'
    \ }
    \ )
endfunction

function! layers#search#bindings() abort
  let g:leader_key_map.s.s = 'Search'
  nmap <leader>ss :<c-u>CocSearch --fixed-strings<space>
  let g:leader_key_map.s.w = 'Search <cword>'
  nmap <expr> <leader>sw <SID>SearchCwordCmd()
  let g:leader_key_map.s['/'] = 'Search <lastsearch>'
  nmap <expr> <leader>s/ <SID>SearchPwordCmd()
  let g:leader_key_map.s.g = 'Grep'
  nnoremap <silent><leader>sg :<c-u>CocList grep<CR>
  let g:leader_key_map.s.f = 'Word in file'
  nnoremap <silent><leader>sf :<c-u>CocList words<CR>

  let g:leader_key_map.s.r = 'Search regex'
  nnoremap <silent><leader>sf :<c-u>CocSearch --regex
endfunction

function! s:SearchCwordCmd()
  return ":\<C-U>CocSearch --fixed-strings " . expand('<cword>')
endfunction

function! s:SearchPwordCmd()
  return ":\<C-U>CocSearch --fixed-strings " . @/
endfunction
