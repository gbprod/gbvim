function! layers#javascript#plugins() abort
endfunction

function! layers#javascript#config() abort
  call add(g:coc_global_extensions, 'coc-json')
  call add(g:coc_global_extensions, 'coc-tsserver')
  call add(g:coc_global_extensions, 'coc-eslint')

  autocmd Filetype json let g:indentLine_setConceal = 0

  let g:neoformat_enabled_javascript = ['prettier']
  let g:neoformat_enabled_json = ['prettier']
endfunction

function! layers#javascript#bindings() abort
endfunction
