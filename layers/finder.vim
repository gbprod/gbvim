function! layers#finder#config() abort
  call add(g:extensions, 'coc-lists')
endfunction

function! layers#finder#bindings() abort
  let g:leader_key_map.f = { "name": '+Finder' }
  let g:leader_key_map.f.f = 'Files'
  nnoremap <silent><leader>ff :call OpenList('files --hidden')<CR>
  nnoremap <silent><c-p> :call OpenList('files --hidden')<CR>
  let g:leader_key_map.b.b = 'Buffers list'
  nnoremap <silent><leader>bb :call OpenList('buffers')<CR>
  let g:leader_key_map.f.m = 'MRU Files'
  nnoremap <silent><leader>fm :call OpenList('mru')<CR>
  let g:leader_key_map.f.M = 'Mappings'
  nnoremap <silent><leader>fM :CocList maps<CR>
  let g:leader_key_map.f.t = 'Tags'
  nnoremap <silent><leader>ft :CocList outline<CR>
  let g:leader_key_map.f.w = 'Files <cword>'
  nnoremap <silent><leader>fw :call OpenList('--input='.expand('<cword>').' files')<CR>
endfunction

function! OpenList(list) abort
  call SelectMain()
  execute "CocList ".a:list
endfunction
