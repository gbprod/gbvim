function! layers#git#plugins() abort
  Plug 'tpope/vim-fugitive'
endfunction

function! layers#git#config() abort
  call add(g:extensions, 'coc-git')

  call coc#config('git', {
    \ 'topRemovedSign': { 'hlGroup': 'GitGutterDelete' }, 
    \ 'removedSign': { 'hlGroup': 'GitGutterDelete' }, 
    \ 'changeRemovedSign': { 'hlGroup': 'GitGutterChange' }, 
    \ 'changedSign': { 'hlGroup': 'GitGutterChange' }, 
    \ 'addedSign': { 'hlGroup': 'GitGutterAdd' }
    \ }
    \ )

  autocmd Filetype gitcommit setlocal nocindent colorcolumn=+1 textwidth=80
endfunction

function! layers#git#bindings() abort
  let g:leader_key_map.g = { 'name': '+Git' }
  let g:leader_key_map.g.s = 'Status'
  nnoremap <silent> <leader>gs :CocList gstatus<CR>
  let g:leader_key_map.g.b = 'Blame'
  nnoremap <silent> <leader>gb :Gblame<CR>
  let g:leader_key_map.g.m = 'Branches'
  nnoremap <silent> <leader>gm :CocList branches<CR>
  let g:leader_key_map.g.m = 'Commits'
  nnoremap <silent> <leader>gm :CocList commits<CR>
  let g:leader_key_map.g.m = 'File commits'
  nnoremap <silent> <leader>gm :CocList bcommits<CR>
  let g:leader_key_map.g.n = 'Next chunk'
  nmap <silent> <leader>gn <Plug>(coc-git-nextchunk)
  let g:leader_key_map.g.N = 'Previous chunk'
  nmap <silent> <leader>gN <Plug>(coc-git-prevchunk)
  let g:leader_key_map.g.i = 'Chunk info'
  nmap <silent> <leader>gi <Plug>(coc-git-chunkinfo)
  let g:leader_key_map.g.c = 'Next conflict'
  nmap <silent> <leader>gc <Plug>(coc-git-nextconflict)
  let g:leader_key_map.g.C = 'Prev conflict'
  nmap <silent> <leader>gC <Plug>(coc-git-prevconflict)
endfunction

