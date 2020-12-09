function! layers#javascript#config() abort
  call add(g:extensions, 'coc-json')
  call add(g:extensions, 'coc-tsserver')
  call add(g:extensions, 'coc-eslint')

  autocmd Filetype json let g:indentLine_setConceal = 0

  autocmd FileType javascript let b:coc_root_patterns = ['package.json']

  autocmd FileType javascript setlocal
    \ shiftwidth=2
    \ tabstop=2

  let g:neoformat_enabled_javascript = ['prettier']
  let g:neoformat_enabled_json = ['prettier']
endfunction

