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
  let g:leader_key_map.g.s = { 'name': '+Status' }
  let g:leader_key_map.g.s.s = 'Status'
  nnoremap <silent> <leader>gss :<C-u>G<CR>

  let g:leader_key_map.g.B = 'Blame'
  nnoremap <silent> <leader>gB :G blame<CR>

  let g:leader_key_map.g.b = 'Branches'
  nnoremap <silent> <leader>gb :<C-u>CocList branches<CR>

  let g:leader_key_map.g.l = { 'name': '+Log' }
  let g:leader_key_map.g.l.o = 'Log'
  nnoremap <silent> <leader>glo :CocList commits<CR>
  let g:leader_key_map.g.l.f = 'File commits'
  nnoremap <silent> <leader>glf :CocList bcommits<CR>

  let g:leader_key_map.g.d = 'File diff'
  nnoremap <silent> <leader>gd :Gdiff<CR>

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
  nnoremap <silent> <leader>gu :CocCommand git.chunkUndo<CR>

  let g:leader_key_map.g.c = { 'name': '+Commit' }
  let g:leader_key_map.g.c.c = 'Commit'
  nnoremap <silent> <leader>gcc :<C-u>G commit<CR>
  let g:leader_key_map.g.c['!'] = 'Commit amend'
  nnoremap <silent> <leader>gc! :<C-u>G commit --amend<CR>

  let g:leader_key_map.g.a = { 'name': '+Add' }

  let g:leader_key_map.g.a.a = 'Add all'
  nnoremap <silent> <leader>gaa :<C-u>Git add --all<CR>
  let g:leader_key_map.g.a.p = 'Add patch'
  nnoremap <silent> <leader>gap :<C-u>G add --patch<CR>

  let g:leader_key_map.g.p = { 'name': '+Push' }

  let g:leader_key_map.g.p['!'] = 'Push force with lease'
  nnoremap <silent> <leader>gp! :<C-u>Git push --force-with-lease<CR>
  let g:leader_key_map.g.p.p = 'Push'
  nnoremap <silent> <leader>gpp :<C-u>Git push<CR>
  let g:leader_key_map.g.p.u = 'Push and set upstream'
  nnoremap <silent><expr> <leader>gpu ":\<C-u>Git push --set-upstream origin " . FugitiveHead(0) . "\<CR>"
" FugitiveHead(0)
  let g:leader_key_map.g.r = { 'name': '+Rebase' }

  let g:leader_key_map.g.r.m = 'Rebase on master'
  nnoremap <silent> <leader>grm :<C-u>call GitRebase()<CR>

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

function GitRebase()
  Git fetch --all
  Git rebase origin/master
endfunction
