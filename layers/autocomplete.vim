function! layers#autocomplete#plugins() abort
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

  let g:extensions = []
  let g:coc_filetype_map = {}
endfunction

function! layers#autocomplete#config() abort
  set updatetime=300
  set shortmess+=c

  let g:coc_disable_startup_warning = 1
  call add(g:extensions, 'coc-dictionary')
endfunction

function! layers#autocomplete#bindings() abort
  let g:leader_key_map.c = { 'name': "+Code" }

  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : ""
  if exists('*complete_info')
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  else
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  endif
  inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up> pumvisible() ? "\<C-p>" : "\<Up>"
  inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
  inoremap <expr> <PageUp> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
  imap <silent><C-n> <C-r>=coc#refresh()<CR>
  imap <silent><C-k> <C-r>=CocActionAsync('showSignatureHelp')<CR>

  let g:leader_key_map.c.g = { 'name': '+Goto' }
  let g:leader_key_map.c.g.d = 'Definition'
  nmap <silent><leader>cgd <Plug>(coc-definition)
  nmap <silent>gd <Plug>(coc-definition)
  let g:leader_key_map.c.g.t = 'Type definition'
  nmap <silent><leader>cgt <Plug>(coc-type-definition)
  let g:leader_key_map.c.g.i = 'Implementation'
  nmap <silent><leader>cgi <Plug>(coc-implementation)
  let g:leader_key_map.c.g.r = 'References'
  nmap <silent><leader>cgr <Plug>(coc-references)

  nnoremap <silent> K :call CocActionAsync('doHover')<CR>
  let g:leader_key_map.c.d = 'Show documentation'
  nnoremap <silent><leader>cd :call CocActionAsync('doHover')<CR>

  nmap <a-cr> <Plug>(coc-codeaction)

  let g:leader_key_map.c.a = 'Code action <motion>'
  xmap <leader>ca <Plug>(coc-codeaction-selected)
  nmap <silent><leader>ca <Plug>(coc-codeaction-selected)
  let g:leader_key_map.c.f = 'Fix current'
  nmap <silent><leader>cf <Plug>(coc-fix-current)
  let g:leader_key_map.c.h = 'Hightlight'
  nmap <silent><leader>ch :call CocActionAsync('highlight')<CR>
  let g:leader_key_map.c.r = 'Rename'
  nmap <silent><leader>cr <Plug>(coc-rename)

  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)
endfunction

function! layers#autocomplete#config_after() abort
  let g:coc_global_extensions = g:extensions
endfunction
