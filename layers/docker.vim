function! layers#docker#config() abort
  call add(g:extensions, 'coc-docker')

  let g:checkers.dockerfile = ['hadolint']
endfunction

