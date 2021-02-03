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

  autocmd Filetype gitcommit set nocindent colorcolumn=+1 textwidth=80
endfunction

function! layers#git#bindings() abort
  let g:leader_key_map.g = { 'name': '+Git' }
  let g:leader_key_map.g.s = 'Status'
  nnoremap <silent> <leader>gs :Gstatus<CR>
  let g:leader_key_map.g.b = 'Blame'
  nnoremap <silent> <leader>gb :Gblame<CR>
  let g:leader_key_map.g.m = 'Branches'
  nnoremap <silent> <leader>gm :CocList branches<CR>
  let g:leader_key_map.g.L = 'Log'
  nnoremap <silent> <leader>gL :CocList commits<CR>
  let g:leader_key_map.g.d = 'File diff'
  nnoremap <silent> <leader>gd :Gdiff<CR>
  let g:leader_key_map.g.C = 'File commits'
  nnoremap <silent> <leader>gC :CocList bcommits<CR>
  let g:leader_key_map.g.n = 'Next chunk'
  nmap <silent> <leader>gn <Plug>(coc-git-nextchunk)
  let g:leader_key_map.g.N = 'Previous chunk'
  nmap <silent> <leader>gN <Plug>(coc-git-prevchunk)
  let g:leader_key_map.g.i = 'Chunk info'
  nmap <silent> <leader>gi <Plug>(coc-git-chunkinfo)
  let g:leader_key_map.g.x = 'Next conflict'
  nmap <silent> <leader>gx <Plug>(coc-git-nextconflict)
  let g:leader_key_map.g.X = 'Prev conflict'
  nmap <silent> <leader>gX <Plug>(coc-git-prevconflict)
  let g:leader_key_map.g.u = 'Undo chunk'
  nnoremap <silent> <leader>gC :CocCommand git.chunkUndo<CR>
  let g:leader_key_map.g.c = 'Commit'
  nnoremap <silent> <leader>gC :<C-u>Gcommit<CR>

  let g:leader_key_map.g.r = { 'name': '+Rebase' }
  let g:leader_key_map.g.r.p = 'Pick'
  nmap <silent> <leader>grp :call RebaseAction('pick')<CR>
  xmap <silent> <leader>grp :call RebaseAction('pick')<CR>
  let g:leader_key_map.g.r.r = 'Reword'
  nmap <silent> <leader>grr :call RebaseAction('reword')<CR>
  xmap <silent> <leader>grr :call RebaseAction('reword')<CR>
  let g:leader_key_map.g.r.e = 'Edit'
  nmap <silent> <leader>gre :call RebaseAction('edit')<CR>
  xmap <silent> <leader>gre :call RebaseAction('edit')<CR>
  let g:leader_key_map.g.r.s = 'Squash'
  nmap <silent> <leader>grs :call RebaseAction('squash')<CR>
  xmap <silent> <leader>grs :call RebaseAction('squash')<CR>
  let g:leader_key_map.g.r.f = 'Fixup'
  nmap <silent> <leader>grf :call RebaseAction('fixup')<CR>
  xmap <silent> <leader>grf :call RebaseAction('fixup')<CR>
  let g:leader_key_map.g.r.b = 'Break'
  nmap <silent> <leader>grb :call RebaseAction('break')<CR>
  xmap <silent> <leader>grb :call RebaseAction('break')<CR>
  let g:leader_key_map.g.r.d = 'Drop'
  nmap <silent> <leader>grd :call RebaseAction('drop')<CR>
  xmap <silent> <leader>grd :call RebaseAction('drop')<CR>
endfunction

function RebaseAction(name, ...)
  exec 's/^\w\+/'.a:name.'/'
endfunction
