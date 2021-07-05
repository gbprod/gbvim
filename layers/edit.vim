function! layers#edit#plugins() abort
  Plug 'tpope/vim-surround'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'andrewradev/splitjoin.vim'
  Plug 'tpope/vim-abolish'
  Plug 'lambdalisue/suda.vim'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'christoomey/vim-sort-motion'

  Plug 'sheerun/vim-polyglot'
endfunction

function! layers#edit#config() abort
  call add(g:extensions, 'coc-pairs')

  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
  set expandtab
  highlight CocCursorRange guibg=#B48EAD guifg=#D8DEE9

  " Whitespaces
  highlight ExtraWhitespace guibg=#3B4252
  let g:better_whitespace_enabled=1
  let g:strip_whitespace_on_save=1
  let g:strip_whitespace_confirm=0

  call coc#config('pairs.enableCharacters', ["(", "[", "{", "'", "\"", "`"])
endfunction

function! layers#edit#bindings() abort
  " Save fast
  nnoremap <c-s> :<c-u>w<CR>
  vnoremap <c-s> :<c-u>w<CR>gv
  cnoremap <c-s> <c-u>w<CR>
  inoremap <c-s> <c-o>:w<CR>

  "Ctrl+Shift+Up/Down to move up and down
  nnoremap <silent><C-S-Down> :m .+1<CR>==
  nnoremap <silent><C-S-Up> :m .-2<CR>==
  inoremap <silent><C-S-Down> <Esc>:m .+1<CR>==gi
  inoremap <silent><C-S-Up> <Esc>:m .-2<CR>==gi
  vnoremap <silent><C-S-Down> :m '>+1<CR>gv=gv
  vnoremap <silent><C-S-Up> :m '<-2<CR>gv=gv

  let g:leader_key_map.O = 'which_key_ignore'
  nnoremap <silent> <space>O :pu! _<cr>:']+1<cr>
  let g:leader_key_map.o = 'which_key_ignore'
  nnoremap <silent> <space>o :pu _<cr>:'[-1<cr>

  " Use tab for indenting in visual mode
  nnoremap > >>_
  nnoremap < <<_
  inoremap <S-Tab> <C-D>
  vnoremap <Tab> >gv
  vnoremap <S-Tab> <gv
  vnoremap > >gv
  vnoremap < <gv

  let g:leader_key_map.j = {
    \ 'name': '+Join/Split',
    \ 'J': 'Oneliner',
    \ 'j': 'Multiple liner',
    \ }
  nmap <silent><leader>jJ :SplitjoinJoin<CR>
  nmap <silent><leader>jj :SplitjoinSplit<CR>

  let g:leader_key_map.x.c = {'name': '+Convert case'}
  let g:leader_key_map.x.c.s = 'snake_case'
  nmap <silent><leader>xcs <Plug>(abolish-coerce-word)s
  vmap <silent><leader>xcs <Plug>(abolish-coerce)s
  let g:leader_key_map.x.c.m = 'MixedCase'
  nmap <silent><leader>xcm <Plug>(abolish-coerce-word)m
  vmap <silent><leader>xcm <Plug>(abolish-coerce)m
  let g:leader_key_map.x.c.c = 'camelCase'
  nmap <silent><leader>xcc <Plug>(abolish-coerce-word)c
  vmap <silent><leader>xcc <Plug>(abolish-coerce)c
  let g:leader_key_map.x.c.u = 'UPPER_CASE'
  nmap <silent><leader>xcu <Plug>(abolish-coerce-word)u
  vmap <silent><leader>xcu <Plug>(abolish-coerce)u
  let g:leader_key_map.x.c['-'] = 'dash-case'
  nmap <silent><leader>xc- <Plug>(abolish-coerce-word)-
  vmap <silent><leader>xc- <Plug>(abolish-coerce)-
  let g:leader_key_map.x.c['.'] = 'dot.case'
  nmap <silent><leader>xc. <Plug>(abolish-coerce-word).
  vmap <silent><leader>xc. <Plug>(abolish-coerce).
  let g:leader_key_map.x.c['<space>'] = 'space case'
  nmap <silent><leader>xc<space> <Plug>(abolish-coerce-word)<space>
  vmap <silent><leader>xc<space> <Plug>(abolish-coerce)<space>
  let g:leader_key_map.x.c.t = 'Title Case'
  nmap <silent><leader>xct <Plug>(abolish-coerce-word)t
  vmap <silent><leader>xct <Plug>(abolish-coerce)t

  let g:leader_key_map.x.o = 'Sort <motion>'
  nmap <silent><leader>xo <Plug>SortMotion
  xmap <silent><leader>xo <Plug>SortMotionVisual

  let g:leader_key_map.x.d = { 'name': 'Delete' }
  let g:leader_key_map.x.d.b = 'Blank lines'
  nmap <silent><leader>xdb :.,/^.\+/g/^$/d<CR>:nohlsearch<CR>

  let g:leader_key_map.f.W = 'Sudo save'
  if has('nvim')
    nmap <silent><leader>fW :SudaWrite<CR>
  else
    nmap <silent><leader>fW :w !sudo tee >/dev/null %<CR>
  endif

  " nmap <silent> <c-a-d> <Plug>(coc-cursors-position)
  " nmap <silent> <c-d> <Plug>(coc-cursors-word)
  " xmap <silent> <c-d> <Plug>(coc-cursors-range)
  " let g:leader_key_map.d = 'Cursor operator <motion>'
  " nmap <leader>d <Plug>(coc-cursors-operator)

  let g:leader_key_map[';'] = 'which_key_ignore'
  nmap <silent><leader>; A;<C-c>
  let g:leader_key_map[','] = 'which_key_ignore'
  nmap <silent><leader>, A,<C-c>
endfunction

