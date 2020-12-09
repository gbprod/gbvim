function! layers#finder#config() abort
  call add(g:extensions, 'coc-lists')
endfunction

function! layers#finder#bindings() abort
  nnoremap <silent><c-p> :call OpenList('files')<CR>
  let g:leader_key_map.b.b = 'Buffers list'
  nnoremap <silent><leader>bb :CocList --number-select buffers<CR>
  let g:leader_key_map.f.m = 'MRU Files'
  nnoremap <silent><leader>fm :CocList --number-select mru<CR>
  let g:leader_key_map.f.M = 'Mappings'
  nnoremap <silent><leader>fM :CocList maps<CR>
  let g:leader_key_map.f.j = 'Marks'
  nnoremap <silent><leader>fj :CocList --number-select marks<CR>
endfunction

function! OpenList(list) abort
  if &filetype ==# 'defx'
    wincmd p
  endif
  execute "CocList --number-select ".a:list 
endfunction
