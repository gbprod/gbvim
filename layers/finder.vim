function! layers#finder#config() abort
  call add(g:extensions, 'coc-lists')
endfunction

function! layers#finder#bindings() abort
  let g:leader_key_map.f = { "name": '+Finder' }
  nnoremap <silent><c-p> :call OpenList('files --hidden')<CR>
  let g:leader_key_map.b.b = 'Buffers list'
  nnoremap <silent><leader>bb :call OpenList('buffers')<CR>
  let g:leader_key_map.f.m = 'MRU Files'
  nnoremap <silent><leader>fm :call OpenList('mru')<CR>
  let g:leader_key_map.f.M = 'Mappings'
  nnoremap <silent><leader>fM :CocList maps<CR>
  let g:leader_key_map.f.t = 'Tags'
  nnoremap <silent><leader>ft :CocList outline<CR>
endfunction

function! OpenList(list) abort
  call SelectMain()
  execute "CocList --number-select ".a:list
endfunction
