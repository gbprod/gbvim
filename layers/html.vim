function! layers#html#plugins() abort
endfunction

function! layers#html#config() abort
  call add(g:coc_global_extensions, 'coc-css')
  call add(g:coc_global_extensions, 'coc-html')

  autocmd Filetype json let g:indentLine_setConceal = 0

  let g:neoformat_enabled_html = ['prettier']
  let g:neoformat_enabled_css = ['prettier']

  autocmd FileType html setlocal
  \ shiftwidth=2
  \ tabstop=2 
  
  autocmd FileType css,less,sass setlocal
  \ shiftwidth=2
  \ tabstop=2 
endfunction

function! layers#html#bindings() abort
endfunction
