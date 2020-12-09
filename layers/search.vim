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
  nmap <leader>ss :<c-u>CocSearch<space>
  let g:leader_key_map.s.w = 'Search <cword>'
  nmap <expr> <leader>sw <SID>SearchCwordCmd()
  let g:leader_key_map.s['/'] = 'Search <lastsearch>'
  nmap <expr> <leader>s/ <SID>SearchPwordCmd()
  let g:leader_key_map.s.g = 'Grep'
  nnoremap <silent><leader>sg :CocList grep<CR>
  let g:leader_key_map.s.f = 'Word in file'
  nnoremap <silent><leader>sf :CocList words<CR>

  nnoremap <leader>sr <Plug>(coc-refactor)
endfunction

function! s:SearchCwordCmd()
  return ":\<C-U>CocSearch " . expand('<cword>')
endfunction

function! s:SearchPwordCmd()
  return ":\<C-U>CocSearch " . @/
endfunction
