function! layers#html#config() abort
  call add(g:extensions, 'coc-css')
  call add(g:extensions, 'coc-html')
  call add(g:extensions, 'coc-stylelint')

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

